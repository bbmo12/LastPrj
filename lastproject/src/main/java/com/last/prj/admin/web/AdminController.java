package com.last.prj.admin.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewService;
import com.last.prj.qna.service.QnaService;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Controller
public class AdminController {

	@Autowired
	private PmemberService pMemberDao;



	@Autowired
	private ReportService reportDao;


	@Autowired
	private PetService petDAO;

	@Autowired
	private MemService memDao;

	@RequestMapping("/main")
	public String main(Model model) {

		int pmemCount = pMemberDao.pmemCount();
		int memCount = memDao.memCount();
		int petCount = petDAO.petCount();

		model.addAttribute("pmemCount", pmemCount);
		model.addAttribute("memCount", memCount);
		model.addAttribute("petCount", petCount);

		System.out.println(pmemCount);
		System.out.println(memCount);
		System.out.println(petCount);

		return "admin/main/main";
	}

	// ======= 파트너 회원 =============

	// 파트너회원 처음에 갈 때
	@RequestMapping("/admPmember")
	public String admPmemberTable() {
		return "admin/board/admPmember";
	}

	// 파트너 code별
	@RequestMapping("/admPlistCode")
	@ResponseBody
	public HashMap<String, Object> admPlistCode(PmemberVO vo,Criteria cri) {
		int total = pMemberDao.admPlistCodeCount(vo);
		PagingVO page = new PagingVO(cri, total);
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		System.out.println(pMemberDao.admPlistCode(vo));
		
		map.put("list", pMemberDao
				.admPlistCode(vo));


		map.put("list", pMemberDao.admPlistCode(vo));

		map.put("page", page);
		System.out.println("=============================" + vo);
		System.out.println("=============================" + pMemberDao.admPlistCode(vo));
		return map;
	}
	
	//파트너 회원 단건 조회 Modal
	@RequestMapping("/admPmemberOne")
	@ResponseBody
	public HashMap<String, Object> admPmemberOne(@RequestParam("p_id")String p_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", pMemberDao.getPmemberinfo(p_id));		
		return map;
	}

	// =========end 파트너 회원 조회==============

	
	// =====================Review=========================
	@RequestMapping("/admReview")
	public String admReviewTable() {
		return "admin/board/admReview";
	}

	@RequestMapping("/admRlistCode")
	@ResponseBody public HashMap<String,Object> admReview(ReportVO vo, Criteria cri){ 
	  int total = reportDao.admRlistCodeCount(vo); 
	  PagingVO page = new PagingVO(cri, total); 
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  vo.setVo(page);
	  map.put("list", reportDao.admRlistCode(vo)); 
	  map.put("page",page);
	  System.out.println("============"+reportDao.admRlistCode(vo));
	  
	  return map; 
	  }

	// =====================end Review=========================

	/*
	 * // ===========QnA==================
	 * 
	 * @RequestMapping("/admQna") public String admQnaTable() { return
	 * "admin/board/admQna"; }
	 * 
	 * @RequestMapping("admQlistCode")
	 * 
	 * @ResponseBody public HashMap<String,Object> admQna(QnaVO vo, Criteria cri){
	 * int total = qnaDAO.admQlistCodeCount(vo); PagingVO page = new PagingVO(cri,
	 * total); HashMap map = new HashMap(); vo.setVo(page);
	 * 
	 * map.put("list", reviewDao.admQlistCode(vo)); map.put("page",page);
	 * System.out.println("============"+vo);
	 * 
	 * return "map"; }
	 */
	// ============== end QnA==================

	// === 신고====
	// 신고관리 페이지 이동
	@RequestMapping("/admReport")
	public String reportList() {
		return "admin/board/admReport";
	}

	// == 신고 조건 별 검색 : 날짜 / 후기 / qna / ... ==

	// 1 qna 글 리스트 조회
	@RequestMapping("/admQnaList")
	@ResponseBody
	public List<ReportVO> admQnaList() {
		return reportDao.admQnaList();
	}

	// 2 후기 글 리스트 조회
	@RequestMapping("/admReviewList")
	@ResponseBody
	public List<ReportVO> admReviewList() {
		return reportDao.admReviewList();
	}

	// 3 신고 코드(유형) 별 리스트 조회
	@RequestMapping("/admReportPart")
	@ResponseBody
	public List<ReportVO> admReportPart(@RequestParam("code") int code) {
		return reportDao.admReportPart(code);
	}

	// 4 신고 처리 별 리스트 조회
	@RequestMapping(value = "/admReportRepor")
	@ResponseBody
	public List<ReportVO> admReportRepor(@RequestParam("repor") int repor) {
		return reportDao.admReportRepor(repor);
	}

	// 4 신고 모달 단건 조회 : QnA
	@RequestMapping(value = "/admReportOneQna")
	@ResponseBody
	public List<ReportVO> admReportOneQna(@RequestParam("rep_no") int repno) {
		System.out.println(repno);
		System.out.println(reportDao.admReportOneQna(repno));
		return reportDao.admReportOneQna(repno);
	}

	// 신고 모달 단건 조회 : Review
	@RequestMapping(value = "/admReportOneReview")
	@ResponseBody
	public List<ReportVO> admReportOneReview(@RequestParam("rep_no") int rep_no) {
		System.out.println(rep_no);
		System.out.println(reportDao.admReportOneReview(rep_no));
		return reportDao.admReportOneReview(rep_no);
	}

	// ?. 신고 처리
	@RequestMapping(value = "/admReportUpdate")
	@ResponseBody
	public String admReportUpdate(@RequestParam("rep_no") int rep_no, @RequestParam("state") String state,
			@RequestParam("repor") int repor) {
		System.out.println("repor의 값" + repor);
		System.out.println("rep_no의 값" + rep_no);
		System.out.println("state의 값" + state);
		reportDao.admReportUpdate(rep_no, repor, state);

		return "admin/board/adminReport";
	}

	// 신고 날짜 검색 : admReportDate
	@RequestMapping(value = "/admReportDate")
	@ResponseBody
	public List<ReportVO> admReportDate(@RequestParam("fromDate") String fromDate,
			@RequestParam("toDate") String toDate) {
		// HttpServletRequest req, PmemberVO pmem
		System.out.println("시작 일~" + fromDate);
		System.out.println("끝 일" + toDate);

		List<ReportVO> list = reportDao.admReportDate(fromDate, toDate);
		System.out.println(list);

		return list;
	}

}