package com.last.prj.service.service;

import java.util.List;

import com.last.prj.pay.service.PayVO;

public interface ServiceMapper {

	public List<ServiceVO> myPetServiceList(String m_id); // 일반회원 결제내역 조회
	
	public int ServiceInsert(ServiceVO vo); //예약할때 같이 서비스 등록
}
