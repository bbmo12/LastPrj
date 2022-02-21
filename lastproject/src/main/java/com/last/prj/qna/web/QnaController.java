package com.last.prj.qna.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	
	@RequestMapping("/qnaMain")
	public String QnaMain() throws Exception{
		return "qna/main/qnaMain";
	}
}
