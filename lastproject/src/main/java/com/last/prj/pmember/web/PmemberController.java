package com.last.prj.pmember.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.pmember.service.PmemberService;

@Controller
public class PmemberController {
	
	@Autowired
	private PmemberService pMemberDao;
	
	@RequestMapping("/pmemberList")
	public String pmemberList(@RequestParam("code") int code, Model model) {
		System.out.println(code);
		model.addAttribute("pmember", pMemberDao.memberList(code));

		System.out.println("아이디"+pMemberDao.memberList(code));
		return "pmember/memberList";
	}
	
	@RequestMapping("/pmemberDetail")
	public String pmemberDetail(@RequestParam("id") String p_id, Model model) {
		System.out.println("상세정보"+p_id);	
		
		model.addAttribute("pmemdetail", pMemberDao.getMember(p_id));
		System.out.println("상세정보1"+pMemberDao.getMember(p_id));
		
		model.addAttribute("picture", pMemberDao.getPicture(p_id));
		System.out.println("상세정보2"+pMemberDao.getPicture(p_id));
		
		return "pmember/memberDetail";
	}


}
