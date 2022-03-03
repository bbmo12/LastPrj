package com.last.prj.fallow.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.fallow.service.FollowService;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followDao;
	
	@RequestMapping("/myfallow")
	public String myfallow(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("follow",followDao.myFollowSearch(m_id));
		return "member/myfallow";
	}
}
