package com.last.prj.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.service.service.ServiceMapper;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;

@Repository("serviceDao")
public class ServiceserviceImpl implements ServiceService {

	@Autowired
	private ServiceMapper map;

	@Override
	public List<ServiceVO> myPetServiceList(String m_id) {
		return map.myPetServiceList(m_id);
	}

	@Override
	public int ServiceInsert(ServiceVO vo) {
		return map.ServiceInsert(vo);
	}

	@Override
	public List<ServiceVO> pMembenefit(String p_id) {
		return map.pMembenefit(p_id);
	}

	@Override
	public int ServiceUpdate(int r_no) {
		return map.ServiceUpdate(r_no);
	}
	
}
