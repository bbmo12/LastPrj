package com.last.prj.qna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetMapper;
import com.last.prj.pet.service.PetService;
import com.last.prj.qna.service.Criteria;
import com.last.prj.qna.service.PagingVO;
import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qna.service.QtagVO;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagMapper;
import com.last.prj.qtag.service.QtagService;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

import freemarker.core.ParseException;

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
	private ReportService reportDAO;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	private PetService petDAO;


	//질문글 리스트, 페이징
	@RequestMapping("/qnaMain")
	public String QnaMain(Criteria cri, Model model){	
		
		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("qnaList", mapper.qnaList(cri));
		model.addAttribute("tagList", qtagDAO.tagList());
		model.addAttribute("best", mapper.qnaBest());
		
		System.out.println(cri);
		
		return "qna/qnaMain";
		
	}

	//태그 클릭 시 동일 태그 글 검색
	@GetMapping(value = "/tagSearch")
	public String tagSearch(@RequestParam("t_name") String t_name, Criteria cri, Model model) {
		System.out.println(t_name);
		
		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("tagSearch", mapper.tagSearch(t_name));
		model.addAttribute("tagList", qtagDAO.tagList());
		
		return "qna/tagSearch";
	}
	
	//리플 수
	@GetMapping("/replyCnt")
	public String replyCnt(Model model) {
		model.addAttribute("cnt", mapper.replyCnt(0));

		return "qna/qnaMain";
	}

	//신고 모달 팝업 처리
	@RequestMapping(value="/newQnaReport", method=RequestMethod.POST)
	public String newQnaReport(HttpServletRequest request, ReportVO report) throws Exception{
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		report.setReporter(request.getParameter("reporter"));
		report.setContent(request.getParameter("content"));
		report.setQ_no(Integer.parseInt(request.getParameter("q_no")));
		report.setReported(request.getParameter("reported"));
		report.setCode(Integer.parseInt(request.getParameter("code")));
		
		System.out.println(report);
		reportDAO.newQnaReport(report);
		
		return "qna/qnaDetail";	
	}

	//질문글 상세 조회 + 조회수 증가 + 작성 회원 정보 조회 + 반려동물 정보 조회
	@GetMapping(value = "/qnaDetail")
	public String qnaDetail(@RequestParam("q_no") int q_no, @RequestParam("writer") String writer, @RequestParam("pet_no") int pet_no, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		qnaDAO.postCnt(q_no);
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("ansDetail", qnaDAO.ansDetail(q_no));
		model.addAttribute("best", mapper.qnaBest());
		model.addAttribute("writerInfo", memDao.memberOne(writer));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));

		return "qna/qnaDetail";
	}
	
	//답변글 폼 이동
	@RequestMapping("/ansForm")
	public String ansForm(@RequestParam("q_no") int q_no, @RequestParam("writer") String writer, @RequestParam("pet_no") int pet_no, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String p_id = (String) session.getAttribute("p_id");
		
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("writerInfo", memDao.memberOne(writer));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));
		
		return "qna/ansForm";
	}
	
	@PostMapping("/newAns")
	public String newAns(QnaVO qna, HttpSession session) {
		
		String m_id = (String) session.getAttribute("m_id");
		String p_id = (String) session.getAttribute("p_id");
		
		qnaDAO.newAns(qna);
		
		return "redirect:qnaDetail";
		
	}
}
