package com.last.prj.notice.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;
import com.last.prj.security.CustomUser;

@Controller
public class NoticeController {
	
	@Autowired
	public NoticeService noticeDao;
	
	@RequestMapping("/testPage")
	public String testPage() {

		return "test/testPage";
	}
	
	@PostMapping("/noticeInsert")
	@ResponseBody
	public String noticeInsert(NoticeVO notice, HttpServletRequest request) {
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("pId");
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = userDetails.getPmember().getP_id();
		notice.setN_from(id);
		noticeDao.noticeInsert(notice);
		return "test/testPage";
	}
	
	@RequestMapping("/noticeCheck")
	@ResponseBody
	public int noticeCheck(HttpServletRequest request,  Principal principal, @RequestParam int notice_no) {
		String id = "";
		if(principal != null) {
			
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(userDetails.getRole() == "일반회원") {
			//System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
			//System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
			id = userDetails.getMember().getM_id();
			
			
		}else if(userDetails.getRole() == "파트너회원") {
			//System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
			//System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			id = userDetails.getPmember().getP_id();
		}

		}
		//System.out.println("notice_no ====="+notice_no);
		
		
		return noticeDao.noticeUpdate(notice_no);
	}
	
	
	@RequestMapping("/noticeCheckCount")
	@ResponseBody
	public int noticeCheckCount(Principal principal) {
		String id = "";
		if(principal != null) {
			
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(userDetails.getRole() == "일반회원") {
			//System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
			//System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
			id = userDetails.getMember().getM_id();
			
			
		}else if(userDetails.getRole() == "파트너회원") {
			//System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
			//System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			id = userDetails.getPmember().getP_id();
		}
		
			
		
		}
		
		return noticeDao.noticeCheckCount(id);
	}
	
}
