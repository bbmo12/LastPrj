package com.last.prj.report.service;

import java.util.List;

public interface ReportMapper {

	// qna 신고 인서트
		int newQnaReport(ReportVO report);
	
	public List<ReportVO> reportList();
	
	//일반사용자 신고내역 조회
	public List<ReportVO> myReportList(String m_id);
}
