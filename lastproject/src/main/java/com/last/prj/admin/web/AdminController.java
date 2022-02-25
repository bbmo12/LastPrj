package com.last.prj.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.board.service.BoardVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;
import com.last.prj.reserv.service.PreservationCodeListVO;

@Controller
public class AdminController {

	@Autowired
	private PmemberService pMemberDao;
	
	@Autowired
	private ReportService reportDao;

	@RequestMapping("/main")
	public String main(Model model) {
		return "admin/main/main";
	}

	//파트너회원 전체 목록
	@RequestMapping("/pmemberTables")
	public String pmemberTable(Model model) {
		List<PmemberVO> list = pMemberDao.admPlist();
		System.out.println(list);
		model.addAttribute("pList",list );
		return "admin/board/pmemberTable";
	}
	
	
	
	// 파트너회원관련 파트너쉽별로
	@RequestMapping("/admPlistCode")
	public String pmemberList(@RequestParam("code") int code, Model model) {
		System.out.println(code);
		List<PmemberVO> list = pMemberDao.admPlistCode(code);
		System.out.println(list);
		model.addAttribute("pmembers",list );
		return "admin/board/pmemberTablePart";
	}


	// 1. 신고리스트 출력
	@RequestMapping("/reportTables")
	public String reportList(Model model) {
		List<ReportVO> list = reportDao.reportList();
		System.out.println(list);
		model.addAttribute("reportList", list);
		return "admin/board/reportTable";
	}
	
	
	// 2. 신고 상세보기 modal 방식
	@GetMapping(value ="/reportDetail")
	public String reportDetail(Model model, ReportVO report) {
		
		return "admin/board/reportTable";
	}

	// 3. 신고 처리 ()

}
