package com.last.prj.service.service;

import java.util.List;

public interface ServiceService {

	public List<ServiceVO> myPetServiceList(String m_id); //내 반려동물 서비스 기록 전체조회
	
	public int ServiceInsert(ServiceVO vo); //예약할때 같이 서비스 등록
}
