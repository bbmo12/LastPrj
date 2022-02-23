package com.last.prj.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.pmember.service.PmemberService;

@Controller
public class AdminController {

	@Autowired
	private PmemberService pMemberDao;

	@RequestMapping("/main.do")
	public String main() {
		return "admin/main/main";
	}

	// 파트너회원관련

	@RequestMapping("/pmemberTables.do")
	public String pmemberList(@RequestParam("code") int code, Model model) {
		System.out.println(code);
		model.addAttribute("pmember", pMemberDao.memberList(code));
		System.out.println("아이디" + pMemberDao.memberList(code));
		return "admin/table/pmemberTables";
	}

	/*
	 * @RequestMapping("/pmemberDetail") public String
	 * pmemberDetail(@RequestParam("name") String name, Model model) {
	 * System.out.println(name); return "pmember/memberDetail"; }
	 */

	// 신고관련

	// 1. 신고리스트 출력
	@RequestMapping("/reportTables.do")
	public String rTables() {
		return "admin/table/reportTable";
	}

	// 2. 신고 상세보기 modal

	// 3. 신고 처리 ()

}
