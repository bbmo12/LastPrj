package com.last.prj.mem.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;
	

	@RequestMapping("/memberMypage")
	public String memMypage() {
		return "mypage/memberMypage";
	}

	@RequestMapping("joinForm") //회원가입
	public String joinForm() {
		
		return "member/joinForm";
	}
	
	@RequestMapping("loginForm") //로그인화면
	public String loginForm() {
		
		return "member/loginForm";
	}
	
	@RequestMapping("/login") //로그인창
	public String loginForm(MemVO member, HttpSession session) {
		member = memDao.memberSelect(member);
		
		if(member != null) {
			session.setAttribute("member", member);
			session.setAttribute("mId", member.getM_id());
			session.setAttribute("password", member.getPassword());
		} else {
			return "member/loginForm";
		}
		System.out.println(member);
		return "redirect:home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	//@RequestMapping("/plogin")
	
	
}
