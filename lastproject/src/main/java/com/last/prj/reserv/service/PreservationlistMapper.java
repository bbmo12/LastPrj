package com.last.prj.reserv.service;

import java.util.List;

public interface PreservationlistMapper {
	
	//파트너회원 예약설정
	//public 
	
	//파트너회원 예약조회
	public List<PreservationVO> preservationlist();
	
	public List<PreservationCodeListVO> preservationCodeList();
	
	
}
