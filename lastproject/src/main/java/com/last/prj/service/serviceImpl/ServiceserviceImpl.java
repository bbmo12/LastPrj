package com.last.prj.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
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
	public List<ServiceVO> pMembenefit(Criteria cri) {
		return map.pMembenefit(cri);
	}

	@Override
	public int pMembenefitTotal(Criteria cri) {
		return map.pMembenefitTotal(cri);
	}

	@Override
	public int ServiceUpdate(int r_no) {
		return map.ServiceUpdate(r_no);
	}

	@Override
	public ServiceVO totalPrice(String p_id) {
		return map.totalPrice(p_id);
	}

	@Override
	public ServiceVO serviceSelect(int r_no) {
		return map.serviceSelect(r_no);
	}

	@Override
	public List<ServiceVO> petService(ServiceVO vo) {
		return map.petService(vo);
	}

	@Override
	public int petServiceCnt(ServiceVO vo) {

		return map.petServiceCnt(vo);
	}

	@Override
	public List<ServiceVO> petProtoColSearch(String key, String data, String m_id) {
		// TODO Auto-generated method stub
		return map.petProtoColSearch(key, data, m_id);
	}
	
}
