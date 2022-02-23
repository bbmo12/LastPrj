package com.last.prj.qna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	//질문글 리스트, 페이징
	@RequestMapping("/qnaMain")
	public String QnaMain(Criteria cri, Model model){	
		
		model.addAttribute("page", new PagingVO(cri, mapper.getTotal(cri)));
		model.addAttribute("qnaList", mapper.qnaList(cri));
		model.addAttribute("tagList", qtagDAO.tagList());
		
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
	
	@GetMapping("/replyCnt")
	public String replyCnt(Model model) {
		model.addAttribute("cnt", mapper.replyCnt(0));

		return "qna/qnaMain";
	}
	
	//질문글 상세 조회 + 조회수 증가
	@GetMapping(value = "/qnaDetail")
	public String qnaDetail(@RequestParam("q_no") int q_no, Model model) {
		
		qnaDAO.postCnt(q_no);
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(q_no));
		model.addAttribute("ansDetail", qnaDAO.ansDetail(q_no));
		
		return "qna/qnaDetail";
	}
	
	
	

}
