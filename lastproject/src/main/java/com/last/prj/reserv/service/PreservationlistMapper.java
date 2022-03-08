package com.last.prj.reserv.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface PreservationlistMapper {
	
	
	//파트너회원 예약조회
	public List<PreservationVO> preservationlist(PreservationVO vo);
	
	//페이징 (파트너예약조회)
	List<PreservationVO> preservationPageList(Criteria cri);
	int preservPage(Criteria cri);
	
	
}
