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

	@RequestMapping("/qnaMain")
	public String QnaMain(Model model){	
		model.addAttribute("qnaList", mapper.qnaList());
		model.addAttribute("tagList", qtagDAO.tagList());
		
		return "qna/qnaMain";
		
	}

	@GetMapping("/replyCnt")
	public String replyCnt(Model model) {
		model.addAttribute("cnt", mapper.replyCnt(0));

		return "qna/qnaMain";
	}
	
//	@ResponseBody
//	@RequestMapping("/getMoreContents_ajax.do")
//	public void getMoreContents(QnaVO paramVO, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ParseException, IOException{
//		
//		
//		
//	}
	

	@RequestMapping("/qnaDetail")
	public String qnaDetail(QnaVO qna, Model model) {
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(qna));
		
		return "qna/qnaDetail";
	}
	

}
