package com.last.prj.ffile.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.ffile.service.FfileService;
import com.last.prj.ffile.service.FfileVO;


public class FfileUtil {
	@Autowired
	private FfileService ffileDao;
	
	public String multiFileUpload(List<MultipartFile> multiFileList,  HttpServletRequest request) {
		FfileVO ffile= new FfileVO();
			System.out.println("multiFileList : " + multiFileList);
				
			// path 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			String root = path + "\\" + "upload";
			
			System.out.printf("realPath: %s\n", root);
			
			File fileCheck = new File(root);
			
			if(!fileCheck.exists()) fileCheck.mkdirs();
				
				
			List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
				
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
					
					
				Map<String, String> map = new HashMap<String, String>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				
				ffile.setPicture(originFile);
				ffile.setPfile(changeFile);
				
				
				ffileDao.ffileInsert(ffile);
				
				fileList.add(map);
			}
			
			//FfileUtil ffileutil = new FfileUtil();
			//ffileutil.multiFileUpload(null, null)
				
			// 파일업로드
			try {
				for(int i = 0; i < multiFileList.size(); i++) {
					File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
					multiFileList.get(i).transferTo(uploadFile);
				}
					
				System.out.println("다중 파일 업로드 성공");
					
				} catch (Exception e) {
					System.out.println("다중 파일 업로드 실패");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
			return "mypage/memberMypage";		
		}
	}

