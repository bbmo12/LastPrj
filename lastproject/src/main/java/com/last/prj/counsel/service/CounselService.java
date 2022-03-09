package com.last.prj.counsel.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface CounselService {

	public List<CounselVO> myCounselList(String m_id); // 일반회원 후기조회

	public List<CounselVO> counselList(Criteria cri);// 상담 페이지리스트

	public int counselPage(Criteria cri);// 상담내역 total

	// 페이징
	int myCounselPage(Criteria cri);

	List<CounselVO> myCounselList(Criteria cri);

	// 상담 상세 조회
	List<CounselVO> csDetail(int p_no);

	// 새로운 상담글 등록
	int newCs(CounselVO cs);

	// 첫 상담 이후 답변글
	int newCsAns(CounselVO cs);

	// 상담 종료시 코드 변환
	int CodeUdt(int c_no);

	// 기존 상담 여부
	int isExist(String m_id, String p_id);

}
