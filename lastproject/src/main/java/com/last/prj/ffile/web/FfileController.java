package com.last.prj.ffile.web;

import java.io.File;
import java.util.List;
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
	
	/*
	 * @PostMapping("/multiFile") public int
	 * multiFileUpload(@RequestParam("multiFile") List<MultipartFile> multiFileList,
	 * FfileVO ffile, HttpServletRequest request) {
	 * System.out.println("multiFileList : " + multiFileList);
	 * 
	 * String originalFileName = file.getOriginalFilename();
	 * 
	 * String webPath = "/resources/upload"; String realPath =
	 * sc.getRealPath(webPath); System.out.printf("realPath: %s\n", realPath);
	 * 
	 * File savePath = new File(realPath); if (!savePath.exists())
	 * savePath.mkdirs();
	 * 
	 * realPath += File.separator + originalFileName; File saveFile = new
	 * File(realPath);
	 * 
	 * if (!originalFileName.isEmpty()) { String uuid =
	 * UUID.randomUUID().toString(); String saveFileName = uuid +
	 * originalFileName.substring(originalFileName.lastIndexOf("."));
	 * 
	 * try { file.transferTo(saveFile); ffile.setPicture(originalFileName);
	 * ffile.setPfile(saveFileName); } catch (Exception e) { e.printStackTrace(); }
	 * }
	 * 
	 * return ffileDao.ffileInsert(ffile); }
	 */
}
