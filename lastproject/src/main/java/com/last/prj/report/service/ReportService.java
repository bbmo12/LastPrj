package com.last.prj.report.service;

import java.util.List;

public interface ReportService {
	
	
	//qna 신고 인서트
	int newQnaReport(ReportVO report);

	public List<ReportVO> reportList();

}
