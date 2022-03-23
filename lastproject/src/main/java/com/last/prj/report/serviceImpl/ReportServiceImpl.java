package com.last.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
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

	@Override
	public List<ReportVO> myReportList(Criteria cri) {
		return map.myReportList(cri);
	}

	@Override
	public List<ReportVO> admQnaList() {
		return map.admQnaList();
	}

	@Override
	public List<ReportVO> admReviewList() {
		return map.admReviewList();
	}
	
	@Override
	public List<ReportVO> admReportPart(int code) {
		return map.admReportPart(code);
	}
	
	@Override
	public List<ReportVO> admReportOneQna(int rep_no) {
		return map.admReportOneQna(rep_no);
	}
	
	@Override
	public int admReportUpdate(int rep_no, int repor, String state) {
		return map.admReportUpdate(rep_no, repor, state);
	}

	@Override
	public List<ReportVO> admReportRepor(int repor) {
		return map.admReportRepor(repor);
	}

	@Override
	public List<ReportVO> admReportOneReview(int rep_no) {
		return map.admReportOneReview(rep_no);
	}

	@Override
	public List<ReportVO> admReportDate(String fromDate, String toDate) {
		return map.admReportDate(fromDate, toDate);
	}

	@Override
	public int pmemReport(Criteria cri) {
		return map.pmemReport(cri);
	}

	@Override
	public List<ReportVO> pmemReportList(Criteria cri) {
		return map.pmemReportList(cri);
	}

	@Override
	public int admRlistCodeCount(ReportVO vo) {
		return map.admRlistCodeCount(vo);
	}

	@Override
	public List<ReportVO> admRlistCode(ReportVO vo) {
		return map.admRlistCode(vo);
	}

	
	@Override
	public ReportVO admReSearch(int rep_no) {
		return map.admReSearch(rep_no);
	}

	@Override
	public int admReSearchUpdate(ReportVO vo) {
		return map.admReSearchUpdate(vo);
	}

	@Override
	public int admQlistCodeCount(ReportVO vo) {
		return map.admQlistCodeCount(vo);
	}

	@Override
	public List<ReportVO> admQlistCode(ReportVO vo) {
		return map.admQlistCode(vo);
	}

	@Override
	public int memReport(Criteria cri) {
		return map.memReport(cri);
	}

	@Override
	public int adminReportedCount() {
		return map.adminReportedCount();
	}

	@Override
	public int adminReportTotalCount() {
		return map.adminReportTotalCount();
	}

	@Override
	public int adminReporCount() {
		return map.adminReporCount();
	}

	@Override
	public List<ReportVO> adminReporList(ReportVO vo) {
		return map.adminReporList(vo);
	}

	@Override
	public int adminReporListCount(ReportVO vo) {
		return map.adminReporListCount(vo);
	}

}
