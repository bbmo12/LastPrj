package com.last.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.last.prj.report.service.ReportMapper;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;

@Repository("reportDao")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportMapper map;

	@Override
	public int newQnaReport(ReportVO report) {
		// TODO Auto-generated method stub
		return map.newQnaReport(report);
	}

	@Override
	public List<ReportVO> reportList() {
		return map.reportList();
	}

}