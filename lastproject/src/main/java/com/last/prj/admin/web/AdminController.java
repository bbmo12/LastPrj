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

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
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
	private PmemberMapper mapper;
	
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

	//=== 파트너 회원 ===
	//파트너회원 페이징
	@RequestMapping("/admPmember")
	public String pmemberTable(Model model, Criteria cri) {
		
		//페이징 처리
		/*
		 * cri.setAmount(7); PagingVO paging = new PagingVO(cri,
		 * mapper.memberPage(cri)); model.addAttribute("page", paging);// 페이징 수
		 * model.addAttribute("pList", mapper.admPmemberPageList(cri));// 페이징 리스트
		 */
		//회원 리스트담기
		
		 List<PmemberVO> list = pMemberDao.admPlist(); 
		 System.out.println(list);
		 model.addAttribute("pList",list );
		 
	
		return "admin/board/admPmember";
	}
	
	//  파트너 code별
	@RequestMapping("/admPlistCode")
	@ResponseBody
	public List<PmemberVO> admPlistCode(@RequestParam("code") int code) {	
		System.out.println(pMemberDao.admPlistCode(code));
		return pMemberDao.admPlistCode(code);
	}
	
	
	//파트너회원 가입일 조회
	@RequestMapping("/admStartDateList")
	@ResponseBody
	public List<PmemberVO> admStartDateList(){
		return pMemberDao.admPstartDateList();
	}
	
	
	
	//=== 신고====

	//신고관리 페이지 이동
	@RequestMapping("/admReport")
	public String reportList() {
		return "admin/board/admReport";
	}
	
	// == 신고 조건 별 검색 : 날짜 / 후기 / qna / ... ==
	
	//1 qna 글 리스트 조회
	@RequestMapping("/admQnaList")
	@ResponseBody
	public List<ReportVO> admQnaList(){		
		return reportDao.admQnaList();
	}
	
	//2 후기 글 리스트 조회
	@RequestMapping("/admReviewList")
	@ResponseBody
	public List<ReportVO> admReviewList(){
		return reportDao.admReviewList();
	}
	
	//3 신고 코드(유형) 별 리스트 조회
	@RequestMapping("/admReportPart")
	@ResponseBody
	public List<ReportVO> admReportPart(@RequestParam("code")int code){
		return reportDao.admReportPart(code);
	}
	
	
	//4 신고 처리 별 리스트 조회
	@RequestMapping(value ="/admReportRepor")
	@ResponseBody
	public List<ReportVO> admReportRepor(@RequestParam("repor")int repor){
		return reportDao.admReportRepor(repor);
	}
	
	//4 신고 모달 단건 조회 : QnA
	@RequestMapping(value ="/admReportOneQna")
	@ResponseBody
	public List<ReportVO> admReportOneQna(@RequestParam("rep_no")int rep_no) {
		System.out.println(rep_no);
		System.out.println(reportDao.admReportOneQna(rep_no));
		return reportDao.admReportOneQna(rep_no);
	}
	
	// 신고 모달 단건 조회 : Review
	@RequestMapping(value ="/admReportOneReview")
	@ResponseBody
	public List<ReportVO> admReportOneReview(@RequestParam("rep_no")int rep_no) {
		System.out.println(rep_no);
		System.out.println(reportDao.admReportOneReview(rep_no));
		return reportDao.admReportOneReview(rep_no);
	}
	
	
	// ?. 신고 처리
	@RequestMapping(value ="/admReportUpdate")
	@ResponseBody
	public String admReportUpdate(@RequestParam("rep_no")int rep_no,@RequestParam("state")String state,@RequestParam("repor")int repor ) {	
		System.out.println(repor);
		System.out.println(rep_no);
		System.out.println(state);
		reportDao.admReportUpdate(repor,rep_no,state);
		

		return "redirect:admin/board/adminReport";
	}
		
}