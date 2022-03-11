package com.last.prj.report.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.pmember.service.Criteria;




public interface ReportService {
	
	
	//qna 신고 인서트
	int newQnaReport(ReportVO report);

	public List<ReportVO> reportList();

	//일반사용자 신고내역 조회
	public List<ReportVO> myReportList(String m_id);
	
	//qna에 대한 신고리스트
	public List<ReportVO> admQnaList();
	//review에 대한 신고리스트
	public List<ReportVO> admReviewList();
	//유형 별 신고리스트
	public List<ReportVO> admReportPart(@RequestParam("code")int code);
	//처리 별 신고리스트
	public List<ReportVO> admReportRepor(@RequestParam("repor")int repor);
	//신고 모달 단건 조회 : QnA
	public List<ReportVO> admReportOneQna(int repno);
	//신고 모달 단건 조회 : Review
	public List<ReportVO> admReportOneReview(int rep_no);
	//신고 처리
	int admReportUpdate(@Param("rep_no")int rep_no, @Param("repor")int repor, @Param("state")String state);
	//신고 날짜 검색
	public List<ReportVO> admReportDate(String fromDate, String toDate); 
	
	public int pmemReport(Criteria cri);//파트너마이페이지 신고내역
	public List<ReportVO> pmemReportList(Criteria cri);

	public int admRlistCodeCount(ReportVO vo);
	public List<ReportVO> admRlistCode(ReportVO vo);
}
