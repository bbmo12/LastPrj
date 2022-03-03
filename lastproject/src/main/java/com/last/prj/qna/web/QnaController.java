package com.last.prj.qna.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.Criteria;
import com.last.prj.qna.service.PagingVO;
import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagService;
import com.last.prj.qtag.service.QtagVO;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaDAO;

	@Autowired
	private QnaMapper mapper;

	@Autowired
	private QtagService qtagDAO;

	@Autowired
	private QnaTagService qtDAO;

	@Autowired
	private ReportService reportDao;

	@Autowired
	private MemService memDao;

	@Autowired
	private PetService petDAO;

	@Autowired
	private PmemberService pMemberDao;

	// 질문글 리스트, 페이징
	@RequestMapping("/qnaMain")
	public String QnaMain(Criteria cri, Model model) {

		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("qnaList", mapper.qnaList(cri));
		model.addAttribute("tagList", qtagDAO.tagList());
		model.addAttribute("best", mapper.qnaBest());

		return "qna/qnaMain";

	}

	// 태그 클릭 시 동일 태그 글 검색
	@GetMapping(value = "/tagSearch")
	public String tagSearch(@RequestParam("t_name") String t_name, Criteria cri, Model model) {

		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("tagSearch", mapper.tagSearch(t_name));
		model.addAttribute("tagList", qtagDAO.tagList());

		return "qna/tagSearch";
	}

	// 신고 모달 팝업 처리
	@RequestMapping(value = "/newQnaReport", method = RequestMethod.POST)
	public String newQnaReport(HttpServletRequest request, ReportVO report) throws Exception {

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		String p_id = (String) session.getAttribute("pId");

		reportDao.newQnaReport(report);

		return "qna/qnaDetail";
	}

	// 질문글 상세 조회 + 조회수 증가 + 작성 회원 정보 조회 + 반려동물 정보 조회 + 파트너 회원 정보 + 댓글 갯수
	@RequestMapping(value = "/qnaDetail")
	public String qnaDetail(@RequestParam("q_no") int q_no, @RequestParam("writer") String writer,
			@RequestParam("pet_no") int pet_no, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		String p_id = (String) session.getAttribute("pId");

		qnaDAO.postCnt(q_no);
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("ansDetail", qnaDAO.ansDetail(q_no));
		model.addAttribute("best", mapper.qnaBest());
		model.addAttribute("writerInfo", memDao.memberOne(writer));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));
		model.addAttribute("cnt", mapper.replyCnt(q_no));

		return "qna/qnaDetail";
	}

	// 로그인 여부 체크 + 질문 폼으로 이동 + m_id별 펫정보 받아감.
	@RequestMapping(value = "/qnaForm")
	public String qnaForm(@RequestParam("m_id") String m_id, HttpSession session, HttpServletResponse write,
			Model model) throws Exception {

		String mId = (String) session.getAttribute("mId");

		if (mId == null) {
			write.setContentType("text/html; charset=UTF-8");
			PrintWriter out_writer = write.getWriter();
			out_writer.println("<script>alert('먼저 로그인하세요.');</script>");
			out_writer.flush();

			return "member/loginForm";
		} else {
			model.addAttribute("petList", petDAO.petmemberList(m_id));
			return "qna/qnaForm";
		}
	}

	// 질문글 작성
	@PostMapping("/qForm")
	public String qForm(HttpServletRequest request, HttpSession session, QnaVO qna, QtagVO qtag, QnaTagVO qnatag)
			throws Exception {

		String mId = (String) session.getAttribute("mId");
		qna.setWriter(mId);

		qtagDAO.newTag(qtag);
		qnaDAO.newQna(qna);
		qtDAO.newQtag(qnatag);

		return "qna/qnaMain";
	}

	// 질문 수정 폼으로 이동 + 기존 글 내용 + 멤버별 펫 정보 받아감.
	@RequestMapping(value = "/qModiForm")
	public String qModiForm(@RequestParam("q_no") int q_no, @RequestParam("m_id") String m_id, HttpSession session, Model model) throws Exception {

		String mId = (String) session.getAttribute("mId");
		
		model.addAttribute("petList", petDAO.petmemberList(m_id));
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));	
		return "qna/qModiForm";
	}

	// 질문 게시글 수정 + 태그 삭제 후 재등록
	@RequestMapping(value = "/qModify")
	public String qModify(HttpServletRequest request, QnaVO qna) throws Exception {

		return "qna/qnaDetail";
	}

	// 질문 삭제(1)
	@RequestMapping(value = "/qDeleteOne", method = RequestMethod.POST)
	public String qDeleteOne(@RequestParam("q_no") int q_no, Model model) throws Exception {
		
		qnaDAO.qDeleteOne(q_no);
		qtDAO.delTags(q_no);
		
		return "qna/qnaDetail";
	}

	// 질문 삭제(2)
	@RequestMapping(value = "/qDeleteTwo", method = RequestMethod.POST)
	public String qDeleteTwo(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.qDeleteTwo(q_no);
		qtDAO.delTags(q_no);

		return "qna/qnaMain";
	}

	// 답변글 작성 모달 처리
	@RequestMapping(value = "/newAns", method = RequestMethod.POST)
	public String newAns(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.newAns(qna);

		return "qna/qnaDetail";
	}

	// 답변글 수정 모달 처리
	@RequestMapping(value = "/ansUpdate", method = RequestMethod.POST)
	public String ansUpdate(HttpServletRequest request, QnaVO qna) throws Exception {

		qnaDAO.ansUpdate(qna);

		return "qna/qnaDetail";
	}

	// 답변글 삭제 ajax
	@RequestMapping(value = "/ansDelete", method = RequestMethod.GET)
	public String ansDelete(@RequestParam("q_no") int q_no, Model model) throws Exception {

		qnaDAO.ansDelete(q_no);
		return "qna/qnaDetail";
	}
}
