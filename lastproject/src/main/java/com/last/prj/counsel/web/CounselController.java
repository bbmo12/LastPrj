package com.last.prj.counsel.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.counsel.service.CounselService;
import com.last.prj.mem.service.MemService;

@Controller
public class CounselController {

	
	@Autowired
	private CounselService counselDao;
	
	@Autowired
	private MemService memDao;
	
	@RequestMapping("/mycounsel")
	public String mycounsel(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("member",memDao.memberSearch(m_id));
		model.addAttribute("mycounsel" ,counselDao.myCounselList(m_id));
		
		return "mypage/mcounselSearch";
	}
}
