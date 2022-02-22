package com.last.prj.mem.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PmemService;
import com.last.prj.mem.service.PmemVO;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;
	
	@Autowired
	private PmemService pmemDao;

	@RequestMapping("/memberMypage")
	public String memMypage() {
		return "mypage/memberMypage";
	}

	@RequestMapping("joinForm") //회원가입
	public String joinForm() {
		
		return "member/joinForm";
	}
	
	@RequestMapping("loginForm") //일반회원로그인화면
	public String loginForm() {
		
		return "member/loginForm";
	}
	
	@RequestMapping("/login") //일반회원로그인창
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
	
	@RequestMapping("/logout") //로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	@RequestMapping("/plogin") //파트너회원 로그인
	public String plogin(PmemVO pmember, HttpSession session) {
		pmember = pmemDao.pmemberSelect(pmember);
		
		if(pmember != null) {
			session.setAttribute("pmember", pmember);
			session.setAttribute("pId", pmember.getP_id());
			session.setAttribute("password", pmember.getPassword());
		} else {
			return "member/loginForm";
		}
		System.out.println(pmember);
		return "redirect:home";
	}
	
	@RequestMapping("/memberIdSearchForm") //일반회원 아이디찾기 폼으로 이동
	public String memberIdSearchForm(
	/* @Param("name") String name, @Param("tel") String tel, Model model */ ) {
		
		/* model.addAttribute("member",memDao.memberIdSearch(name, tel)); */
		
		return "member/memIdSearchForm";
	}
	
}
