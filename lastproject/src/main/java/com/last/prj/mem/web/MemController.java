package com.last.prj.mem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;
	
	@RequestMapping("/memberMypage")
	public String memMypage() {
		return "mypage/memberMypage";
	}
}
