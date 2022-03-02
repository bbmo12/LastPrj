package com.last.prj;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.notice.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	public NoticeService noticeDao;

	@RequestMapping("/home")
	public String home(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mId");
		model.addAttribute("noticeList", noticeDao.noticeSelectList(id));
		return "home/home";
	}
	
}