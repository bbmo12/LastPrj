package com.last.prj.mem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.prj.mem.service.MemService;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;
}