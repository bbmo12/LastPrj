package com.last.prj.ffile.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.ffile.service.FfileService;
import com.last.prj.ffile.service.FfileVO;
import com.last.prj.ffile.service.FilemasterVO;

@Service
public class FfileUtil {

	@Autowired
	private FfileService ffileDao;

	public int multiFileUpload(List<MultipartFile> multiFileList, HttpServletRequest request) {
		FilemasterVO filemaster = new FilemasterVO();
		FfileVO ffile = new FfileVO();

		System.out.println("multiFileList : " + multiFileList);

		// path 가져오기

		String webPath = "/resources/upload";
		// String realPath = sc.getRealPath(webPath);

		String realPath = request.getSession().getServletContext().getRealPath("resources/upload");
		// String root = path + "\\" + "upload";

		System.out.printf("realPath: %s\n", realPath);

		File fileCheck = new File(realPath);

		if (!fileCheck.exists())
			fileCheck.mkdirs();

		List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
		ffileDao.fmInsert(filemaster);
		int result = filemaster.getF_part();

		System.out.println("result : " + result);

		for (int i = 0; i < multiFileList.size(); i++) {
			if (multiFileList.get(i) == null || multiFileList.get(i).getSize() == 0) {
				continue;
			}
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;

			Map<String, String> map = new HashMap<String, String>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);

			ffile.setPicture(originFile);
			ffile.setPfile(changeFile);

			ffile.setF_part(result);
			ffileDao.ffileInsert(ffile);

			fileList.add(map);

			File uploadFile = new File(realPath + "\\" + fileList.get(i).get("changeFile"));
			try {
				multiFileList.get(i).transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
				// 만약 업로드 실패하면 파일 삭제
				for (int J = 0; J < multiFileList.size(); J++) {
					if (multiFileList.get(i) != null && multiFileList.get(i).getSize() > 0) {
						new File(realPath + "\\" + fileList.get(J).get("changeFile")).delete();
					}

				}

			}
		}

		return result;
	}

	public static List<MultipartFile> getMultiFileList(List<MultipartFile> multiFileList) {
		List<MultipartFile> returnList = new ArrayList<MultipartFile>();
		for (MultipartFile temp : multiFileList) {
			if (temp.getSize() > 0) {
				returnList.add(temp);
			}
		}

		return returnList;
	}
	
	public static MultipartFile getMultiFile(MultipartFile file) {
		MultipartFile returnFile = null;
		
			if (file.getSize() > 0) {
				returnFile = file;
			}

		return returnFile;
	}
}
