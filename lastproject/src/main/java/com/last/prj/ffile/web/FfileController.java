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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.ffile.service.FfileService;
import com.last.prj.ffile.service.FfileVO;

@Controller
public class FfileController {
	@Autowired
	private FfileService ffileDao;
	
	@Autowired
	ServletContext sc;
	
	@PostMapping("/multiFile")
	public String multiFileUpload(@RequestParam("multiFile") List<MultipartFile> multiFileList,@RequestParam int f_part,@RequestParam String w_write, FfileVO ffile, HttpServletRequest request) {
		
			System.out.println("multiFileList : " + multiFileList);
				
			// path 가져오기
			String webPath = "/resources/upload";
			String realPath = sc.getRealPath(webPath);
			
			System.out.printf("realPath: %s\n", realPath);
			
			File fileCheck = new File(realPath);
			
			if(!fileCheck.exists()) fileCheck.mkdirs();
				
				
			List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
				
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
					
					
				Map<String, String> map = new HashMap<String, String>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				
				ffile.setF_part(f_part);
				ffile.setW_write(w_write);
				ffile.setPicture(originFile);
				ffile.setPfile(changeFile);
				
				ffileDao.ffileInsert(ffile);
				
				fileList.add(map);
			}
				
			// 파일업로드
			try {
				for(int i = 0; i < multiFileList.size(); i++) {
					File uploadFile = new File(realPath + "\\" + fileList.get(i).get("changeFile"));
					multiFileList.get(i).transferTo(uploadFile);
				}
					
				System.out.println("다중 파일 업로드 성공");
					
				} catch (Exception e) {
					System.out.println("다중 파일 업로드 실패");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(realPath + "\\" + fileList.get(i).get("changeFile")).delete();
					}

					e.printStackTrace();
				}
			return "mypage/memberMypage";		
		}
	}
