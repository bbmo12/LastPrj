package com.last.prj.pay.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface PayService {

	public List<PayVO> myPayList(String m_id); // 일반회원 결제내역 조회
	
	public int payInsert(PayVO po);
	
	//페이징
	public List<PayVO> myPayList1(Criteria cri);
	int paypage(Criteria cri);
	
	
}
