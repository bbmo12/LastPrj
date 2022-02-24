package com.last.prj.report.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.report.service.ReportMapper;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Repository("reportDAO")
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportMapper map;
	
	@Override
	public int newQnaReport(ReportVO report) {
		// TODO Auto-generated method stub
		return map.newQnaReport(report);
	}

}
