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
	
}
