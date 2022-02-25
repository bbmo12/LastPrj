package com.last.prj.report.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Controller
public class ReportController { 
	
	
	
	@Autowired
	private ReportService reportDao;
	
	//<!-- 신고 유형 리스트 -->

	@RequestMapping("/reportTables")
	public String reportList(Model model) {
		
		List<ReportVO> list = reportDao.reportList();
		System.out.println(list);
		model.addAttribute("reportList", list);
		return "admin/table/reportTable";
	}
	
	
	//<!-- 신고전체 리스트 -->

	
	//<!-- 신고 전체 건수 -->

	//<!-- 신고 유형에 따른 신고 건수 -->
	
}
