package com.last.prj;


import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.QnaService;
import com.last.prj.security.CustomUser;

@Controller
public class HomeController {
	
	@Autowired
	public NoticeService noticeDao;
	
	@Autowired
	public PmemberService pMemberDao;
	
	@Autowired QnaService qnaDAO;

	@RequestMapping("/home")
	public String home(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mId");
		//model.addAttribute("noticeList", noticeDao.noticeSelectList(id));
		model.addAttribute("bestList", pMemberDao.bestLikeList());
		model.addAttribute("serviceReviewList", pMemberDao.ServiceReviewList());
		model.addAttribute("qnaRecent", qnaDAO.qnaRecent());
		
		return "home/home";
	}
	
	@RequestMapping("/noticeList")
	@ResponseBody
	public List<NoticeVO> noticeList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mId");
		model.addAttribute("noticeList", noticeDao.noticeSelectList(id));
		return noticeDao.noticeSelectList(id);
	}
	
	@RequestMapping("/getId")
	@ResponseBody
	public String getSessionId(Model model, Principal principal) {
		System.out.println(principal);
		
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}
		}
		return "home/home";
		/*
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mId");
		String pid = (String) session.getAttribute("pId");
		
		if(mid != null) {
			return mid;
		}else {
			return pid;
		}
		*/
	}
	
}