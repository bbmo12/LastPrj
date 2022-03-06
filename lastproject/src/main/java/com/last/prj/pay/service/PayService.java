package com.last.prj.pay.service;

import java.util.List;

public interface PayService {

	public List<PayVO> myPayList(String m_id); // 일반회원 결제내역 조회
	
	public int payInsert(PayVO po);
	
	
}
