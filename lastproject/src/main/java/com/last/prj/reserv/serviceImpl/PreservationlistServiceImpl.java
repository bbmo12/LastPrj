package com.last.prj.reserv.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.reserv.service.PreservationCodeListVO;
import com.last.prj.reserv.service.PreservationlistMapper;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.PreservationVO;

@Repository("pReservationDao")
public class PreservationlistServiceImpl implements PreservationlistService {
	
	@Autowired
	private PreservationlistMapper map;
	
	@Override
	public List<PreservationVO> preservationlist(PreservationVO vo) {
		return map.preservationlist(vo);
	}

	@Override
	public List<PreservationVO> preservationPageList(Criteria cri) {
		return map.preservationPageList(cri);
	}

	@Override
	public int preservPage(Criteria cri) {
		return map.preservPage(cri);
	}


}
