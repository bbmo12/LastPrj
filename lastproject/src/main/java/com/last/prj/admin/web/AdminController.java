package com.last.prj.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;

@Controller
public class AdminController {

	@Autowired
	private PmemberService pMemberDao;

	@RequestMapping("/main.do")
	public String main() {
		return "admin/main/main";
	}

	//파트너회원 전체 목록
	@RequestMapping("/pmemberTables.do")
	public String pmemberTable(Model model) {
		List<PmemberVO> list = pMemberDao.admPlist();
		System.out.println(list);
		
		model.addAttribute("pList", list);
		return "admin/table/pmemberTable";
	}
	
	
	//Ajax로 전체 목록 페이지에서 표출
	// 파트너회원관련 파트너쉽별로
	@RequestMapping("/admPlistCode")
	public String pmemberList(@RequestParam("code") int code, Model model) {
		List<PmemberVO> list = pMemberDao.admPlistCode(code);
		System.out.println(list);
		model.addAttribute("pmembers",list );
		return "admin/table/pb";
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
