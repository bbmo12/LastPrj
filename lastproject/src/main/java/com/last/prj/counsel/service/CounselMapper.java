package com.last.prj.counsel.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface CounselMapper {

	public List<CounselVO> myCounselList(String m_id); //일반회원 후기조회
	public List<CounselVO> counselList(Criteria cri);//상담 페이지리스트
	public int counselPage(Criteria cri);//상담내역 total
}
