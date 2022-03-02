package com.last.prj.report.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Controller
public class ReportController { 
		
	@Autowired
	private ReportService reportDao;
	
	@Autowired
	private MemService memDao;

	//<!-- 신고전체 리스트 -->

	
	//<!-- 신고 전체 건수 -->

	
	//<!-- 신고 유형에 따른 신고 건수 -->
	
	
	//일반회원 신고내역 조회
}
