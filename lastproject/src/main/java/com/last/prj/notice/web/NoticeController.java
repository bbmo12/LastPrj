package com.last.prj.notice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public NoticeService noticeDao;
	
	@RequestMapping("/testPage")
	public String testPage() {

		return "test/testPage";
	}
	
	@PostMapping("/noticeInsert")
	@ResponseBody
	public String noticeInsert(NoticeVO notice, HttpServletRequest request) {
		System.out.println("여기까지");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("pId");
		System.out.println("pid:왜 못받아"+id);
		notice.setN_from(id);
		noticeDao.noticeInsert(notice);
		return "test/testPage";
	}
}
