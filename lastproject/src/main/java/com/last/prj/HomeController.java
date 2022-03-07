package com.last.prj;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.QnaService;

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
	public String getSessionId(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mId");
		String pid = (String) session.getAttribute("pId");
		
		if(mid != null) {
			return mid;
		}else {
			return pid;
		}
	}
	
}