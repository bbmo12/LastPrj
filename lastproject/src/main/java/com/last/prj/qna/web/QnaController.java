package com.last.prj.qna.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qna.service.QtagVO;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagMapper;
import com.last.prj.qtag.service.QtagService;

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
	public String QnaMain(Model model) {

		List<QnaVO> qnaList = mapper.qnaList();
		List<QtagVO> tagList = qtagDAO.tagList();
		List<QnaTagVO> qtList = qtDAO.qtList();
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("qtList", qtList);

		return "qna/qnaMain";
	}

	@GetMapping("/replyCnt")
	public String replyCnt(Model model) {
		model.addAttribute("cnt", mapper.replyCnt(0));

		return "qna/qnaMain";
	}

	@RequestMapping("/qnaDetail")
	public String qnaDetail(QnaVO qna, Model model) {
		model.addAttribute("qnaDetail", qnaDAO.qnaDetail(qna));
		return "qna/qnaDetail";
	}

}
