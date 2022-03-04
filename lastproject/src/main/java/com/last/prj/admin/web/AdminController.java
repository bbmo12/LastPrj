package com.last.prj.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewService;
import com.last.prj.pmember.service.ReviewVO;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;


@Controller
public class AdminController {

	@Autowired
	private PmemberService pMemberDao;
	
	@Autowired
	private ReportService reportDao;
	
	@Autowired
	private ReviewService reviewDao;
	
	@Autowired
	private QnaService qnaDAO;

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
	@ResponseBody
	public List<PmemberVO> admPlistCode(@RequestParam("code") int code, Model model) {	
		System.out.println(pMemberDao.admPlistCode(code));
		return pMemberDao.admPlistCode(code);
	}
	
	
	//파트너회원 가입일 조회
	@RequestMapping("/admStartDateList")
	@ResponseBody
	public List<PmemberVO> admStartDateList(){
		
		return pMemberDao.admPstartDateList();
	}
	
	// 1. 신고

	//신고관리 페이지 이동
	@RequestMapping("/admReportList")
	public String reportList() {
		return "redirect:reportList";
	}
	
	//2. 신고 조건 별 검색 : 날짜 / 후기 / qna / ... 
	
	
	
	//1.1 qna 글 리스트 조회
	@RequestMapping("/admQnaList")
	@ResponseBody
	public List<ReportVO> admQnaList(){
		
		return reportDao.admQnaList();
	}
	
	//1.2 후기 글 리스트 조회
	@RequestMapping("/admReviewList")
	@ResponseBody
	public List<ReportVO> admReviewList(){
		
		return reportDao.admReviewList();
	}
	
	
	
	// 2. 신고 처리
	@GetMapping(value ="/permitReport")
	public String reportDetail(Model model, ReportVO report) {
		
		return "admin/board/reportTable";
	}
}
