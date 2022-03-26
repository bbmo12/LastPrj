package com.last.prj.admin.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewService;
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
	private PetService petDAO;

	@Autowired
	private MemService memDao;

	@Autowired
	private BoardService boardDao;

	// 신고 제재 처리 중인 회원

	// 신고 제재 중인 회원

	// QnA에 대한 신고 목록

	// Review에 대한 신고 목록

	@RequestMapping("/adminReporList")
	@ResponseBody
	public HashMap<String, Object> adminReporList(ReportVO vo, Criteria cri) {
		int total = reportDao.adminReporListCount(vo);

		PagingVO page = new PagingVO(cri, total);
		// page.setAmount(9);
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);
		map.put("list", reportDao.adminReporList(vo));
		map.put("page", page);

		return map;
	}

	// reportPage count
	@RequestMapping("/adminReportCount")
	@ResponseBody
	public HashMap<String, Object> adminReportCount() {

		HashMap<String, Object> map = new HashMap<String, Object>();

		// 총 신고 건수
		map.put("adminReportTotalCount", reportDao.adminReportTotalCount());

		// 신고 제재 대상 회원 건수
		map.put("adminReporCount", reportDao.adminReporCount());

		// 신고 제재 중인 회원
		map.put("adminReportedCount", reportDao.adminReportedCount());

		return map;
	}

	// adminPage
	@RequestMapping("/adminPage")
	public String adminPage(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);

		return "adm/adminPage";
	}

	// petList
	@RequestMapping("/adminPetListCode")
	@ResponseBody
	public String adminPetListCode() {
		return "petDAO.adminPetListCode()";
	}

	@RequestMapping("/adminBoardPage")
	public String adminBoardPage(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "adm/adminBoardPage";

	}

	// board 게시판 홈페이지 출력 admBoard
	@RequestMapping("/admBoard")
	public String admBoard(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "adm/admBoard";

	}

	// 게시글 입력
	@RequestMapping("/boardInsert")
	public String boardInsert(BoardVO board, Model model) {
		// System.out.println(board.getNotice_title());
		boardDao.boardInsert(board);
		return "redirect:adminBoardPage";
	}

	// 게시글 수정
	@RequestMapping(value = "/boardUpdate")
	public String boardUpdate(BoardVO board, Model model) {
		boardDao.boardUpdate(board);
		return "redirect:adminBoardPage";

	}

	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("b_no") int b_no, BoardVO board, Model model) {
		boardDao.boardDelete(b_no);
		return "redirect:adminBoardPage";
	}

	// admBoardSearch
	@RequestMapping("/admBoardSearch")
	@ResponseBody
	public List<BoardVO> admBoardSearch(@RequestParam("key") String key, @RequestParam("data") String data) {
		System.out.println("key : " + key);
		System.out.println("data : " + data);
		System.out.println(boardDao.boardSearch(key, data));
		return boardDao.boardSearch(key, data);
	}

	@RequestMapping("/adminMemberPage")
	public String adminMemberPage() {
		return "adm/adminMemberPage";
	}

	// =========신고 페이지 시작~

	@RequestMapping("/adminReportPage")
	public String adminReportPage() {
		return "adm/adminReportPage";
	}

	@RequestMapping("/admQlistCode")
	@ResponseBody
	public HashMap<String, Object> admQna(ReportVO vo, Criteria cri) {
		int total = reportDao.admQlistCodeCount(vo);
		PagingVO page = new PagingVO(cri, total);
		// page.setAmount(9); // n개씩 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		map.put("list", reportDao.admQlistCode(vo));
		map.put("page", page);
		System.out.println("============" + vo);

		return map;
	}

	@RequestMapping(value = "/admReportOneQna")
	@ResponseBody
	public List<ReportVO> admReportOneQna(@RequestParam("rep_no") int repno) {
		System.out.println(repno);
		System.out.println(reportDao.admReportOneQna(repno));
		return reportDao.admReportOneQna(repno);
	}

	// ==============차트 페이지 시작~

	@RequestMapping("/adminChartPage")
	public String adminChartPage() {
		return "adm/adminChartPage";
	}

	@RequestMapping("/adminCount")
	@ResponseBody
	public HashMap<String, Object> adminCount() {
		// 펫 마리수
		// int petCount = petDAO.petCount();
		// 파트너 회원 수
		int pmemCount = pMemberDao.pmemCount();
		// 일반 회원 수
		int memCount = memDao.memCount();

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("petCount", petDAO.petCount());
		map.put("pmemCount", pMemberDao.pmemCount());
		map.put("memCount", memDao.memCount());

		return map;
	}

	// =======================================================================================================================

	@RequestMapping("/goChart")
	@ResponseBody
	public List<PmemberVO> goChart() {
		return pMemberDao.admgoChart();
	}

	@RequestMapping("/main")
	public String main(Model model) {

		int pmemCount = pMemberDao.pmemCount();
		int memCount = memDao.memCount();
		int petCount = petDAO.petCount();
		// String pmemDateList = pMemberDao.pmemDateList();

		model.addAttribute("pmemCount", pmemCount);
		model.addAttribute("memCount", memCount);
		model.addAttribute("petCount", petCount);

		System.out.println(pmemCount);
		System.out.println(memCount);
		System.out.println(petCount);

		return "admin/main/main";
	}

	// ============================일반 회원==========================
	@RequestMapping("/admMember")
	public String admMemberTable() {
		return "admin/board/admMember";
	}

	@RequestMapping("/admMlistCode")
	@ResponseBody
	public HashMap<String, Object> admMlistCode(MemVO vo, Criteria cri) {
		System.out.println("VO가 뭔데 대체" + vo);
		int total = memDao.adMmemCount(vo);
		System.out.println("total은~" + total);
		PagingVO page = new PagingVO(cri, total);

		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		map.put("list", memDao.admMlistCode(vo));
		map.put("page", page);
		return map;

	}

	@RequestMapping("/admMemChart")
	@ResponseBody
	public HashMap<String, Object> admMemChart(@RequestParam("fromDate")String fromDate, @RequestParam("toDate")String toDate) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memChart", memDao.admMemChart(fromDate,toDate));
		map.put("pmemChart", pMemberDao.admPmemChart(fromDate,toDate));
		return map;
	}

	@RequestMapping("/amdPetChart")
	@ResponseBody
	public List<PetVO> amdPetChart() {
		return petDAO.amdPetChart();

	}

	// ==========================end 일반 회원=======================

	// ======= 파트너 회원 =============

	// 파트너회원 처음에 갈 때
	@RequestMapping("/admPmember")
	public String admPmemberTable() {
		return "admin/board/admPmember";
	}

	// 파트너 code별
	@RequestMapping("/admPlistCode")
	@ResponseBody
	public HashMap<String, Object> admPlistCode(PmemberVO vo, Criteria cri) {
		int total = pMemberDao.admPlistCodeCount(vo);
		System.out.println("total은~" + total);
		PagingVO page = new PagingVO(cri, total);
		// page.setAmount(9); // n개씩 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		// 메인 파트너쉽 별 명 수
		System.out.println("차트~" + pMemberDao.admPlistChart(vo));

		if (pMemberDao.admPlistChart(vo) != null) {
			map.put("chart", pMemberDao.admPlistChart(vo));
		}

		System.out.println(pMemberDao.admPlistCode(vo));

		map.put("list", pMemberDao.admPlistCode(vo));

		map.put("page", page);
		System.out.println("=============================" + vo);
		System.out.println("=============================" + pMemberDao.admPlistCode(vo));
		return map;
	}

	// 파트너 회원 단건 조회 Modal
	@RequestMapping("/admPmemberOne")
	@ResponseBody
	public HashMap<String, Object> admPmemberOne(@RequestParam("p_id") String p_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("list", pMemberDao.getPmemberinfo(p_id));
		
		
		return map;
	}
	
	// 	일반 회원 단건 조회 Modal
		@RequestMapping("/admMemberOne")
		@ResponseBody
		public HashMap<String, Object> admMemberOne(@RequestParam("m_id") String m_id) {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("list", memDao.memberOne(m_id));			
			
			return map;
		}
	

	// =========end 파트너 회원 조회==============

	@RequestMapping("/admService")
	public String admService() {
		return "admin/board/admService";
	}

	// =====================Review=========================
	@RequestMapping("/admReview")
	public String admReviewTable() {
		return "admin/board/admReview";
	}

	@RequestMapping("/admRlistCode")
	@ResponseBody
	public HashMap<String, Object> admReview(ReportVO vo, Criteria cri) {
		System.out.println("vo는~~~~~~~" + vo);
		int total = reportDao.admRlistCodeCount(vo);
		PagingVO page = new PagingVO(cri, total);
		// page.setAmount(9); // n개씩 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);
		map.put("list", reportDao.admRlistCode(vo));
		map.put("page", page);
		System.out.println("============" + reportDao.admRlistCode(vo));

		// count

		return map;
	}

	// 신고 모달 단건 조회 : Review
	@RequestMapping(value = "/admReportOneReview")
	@ResponseBody
	public List<ReportVO> admReportOneReview(@RequestParam("rep_no") int rep_no) {
		System.out.println(rep_no);
		System.out.println(reportDao.admReportOneReview(rep_no));
		return reportDao.admReportOneReview(rep_no);
	}

	// =====================end Review=========================

	// ===========QnA==================

	@RequestMapping("/admQna")
	public String admQnaTable() {
		return "admin/board/admQna";
	}

	// ============== end QnA==================

	// === 신고====
	// 신고관리 페이지 이동

	@RequestMapping("/admReport")
	public String reportList() {
		return "admin/board/admReport";
	}

	/*
	 * @RequestMapping("/admQnaList")
	 * 
	 * @ResponseBody public List<ReportVO> admQnaList() { return
	 * reportDao.admQnaList(); }
	 * 
	 * // 2 후기 글 리스트 조회
	 * 
	 * @RequestMapping("/admReviewList")
	 * 
	 * @ResponseBody public List<ReportVO> admReviewList() { return
	 * reportDao.admReviewList(); }
	 * 
	 * // 3 신고 코드(유형) 별 리스트 조회
	 * 
	 * @RequestMapping("/admReportPart")
	 * 
	 * @ResponseBody public List<ReportVO> admReportPart(@RequestParam("code") int
	 * code) { return reportDao.admReportPart(code); }
	 * 
	 * // 4 신고 처리 별 리스트 조회
	 * 
	 * @RequestMapping(value = "/admReportRepor")
	 * 
	 * @ResponseBody public List<ReportVO> admReportRepor(@RequestParam("repor") int
	 * repor) { return reportDao.admReportRepor(repor); }
	 */

	// 신고 처리 == 여기서 신고처리 테이블로 인서트 시켜줘야
	@RequestMapping(value = "/admReportUpdate")
	@ResponseBody
	public String admReportUpdate(@RequestParam("rep_no") int rep_no, @RequestParam("state") String state,
			@RequestParam("repor") int repor, ReportVO vo) {
		System.out.println("repor의 값" + repor);
		System.out.println("rep_no의 값" + rep_no);
		System.out.println("state의 값" + state);

		vo = reportDao.admReSearch(rep_no); // 신고 처리할 애가 member 인지 p_member인지 조회 id,role
		System.out.println("vo는=======" + vo);

		if (repor == 701) { // 신고 미처리

			return "admin/board/adminReport";

		} else if (repor == 702) { // 신고기각처리

			reportDao.admReportUpdate(rep_no, repor, state); // 신고 처리 update
			// 관련 회원에게 메시지 보내기

		} else if (repor == 703) { // 신고 승인 처리

			reportDao.admReportUpdate(rep_no, repor, state); // 신고 처리 update
			reportDao.admReSearchUpdate(vo); // 신고카운트 업데이트

		}

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

	// 일반회원 신고 제재 대상
	@RequestMapping("/admMemRepor")
	public String admMemRepor() {
		return "admin/board/admMemRepor";
	}

	// 일반회원 신고 제재 대상 리스트 출력
	@RequestMapping("/admMemReporList")
	@ResponseBody
	public HashMap<String, Object> admMemReporList(MemVO vo, Criteria cri) {
		System.out.println("VO가 뭔데 대체" + vo);
		int total = memDao.admMemReportCount();
		System.out.println("total은~" + total);
		PagingVO page = new PagingVO(cri, total);
		page.setAmount(9);
		// n개씩 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		map.put("list", memDao.admMemReporCode(vo));
		map.put("page", page);
		return map;
	}

	// 파트너회원 신고 제재 대상
	@RequestMapping("/admPmemRepor")
	public String admPmemRepor() {
		return "admin/board/admPmemRepor";
	}

	// admPmemReporList
	// 파트너회원 신고 제재 대상 리스트 출력
	@RequestMapping("/admPmemReporList")
	@ResponseBody
	public HashMap<String, Object> admPmemReporList(PmemberVO vo, Criteria cri) {
		System.out.println("VO가 뭔데 대체" + vo);
		int total = pMemberDao.admPmemReportCount();
		System.out.println("total은~" + total);
		PagingVO page = new PagingVO(cri, total);
		page.setAmount(9);
		// n개씩 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
		vo.setVo(page);

		map.put("list", pMemberDao.admPmemReporList(vo));
		map.put("page", page);
		return map;
	}

}