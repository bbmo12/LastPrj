package com.last.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	public NoticeService noticeService;
	
	@RequestMapping("/testPage")
	public String testPage() {

		return "test/testPage";
	}
	
	@PostMapping("/noticeInsert")
	@ResponseBody
	public String noticeInsert(NoticeVO notice) {
		noticeService.noticeInsert(notice);
		return "test/testPage";
	}
}
