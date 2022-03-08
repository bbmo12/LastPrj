package com.last.prj.counsel.service;

import java.util.List;

public interface CounselService {

	public List<CounselVO> myCounselList(String m_id); //일반회원 후기조회
	public List<CounselVO> pmemCounselList(String p_id); //파트너회원 상담내역
}
