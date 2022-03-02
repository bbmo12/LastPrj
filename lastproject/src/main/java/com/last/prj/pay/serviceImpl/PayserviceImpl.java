package com.last.prj.pay.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pay.service.PayMapper;
import com.last.prj.pay.service.PayService;
import com.last.prj.pay.service.PayVO;


@Repository("payDao")
public class PayserviceImpl implements PayService {

	
	@Autowired
	private PayMapper map;

	@Override
	public List<PayVO> myPayList(String m_id) {
		return map.myPayList(m_id);
	}

	
}
