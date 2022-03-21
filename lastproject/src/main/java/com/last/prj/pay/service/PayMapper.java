package com.last.prj.pay.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface PayMapper {

	public List<PayVO> myPayList(String m_id);
	
	public int payInsert(PayVO po);
	
	//페이징
	public List<PayVO> myPayList1(Criteria cri);
	Integer paypage(Criteria cri);
	
}
