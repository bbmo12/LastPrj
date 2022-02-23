package com.last.prj.reserv.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.reserv.service.PreservationCodeListVO;
import com.last.prj.reserv.service.PreservationlistMapper;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.PreservationlistVO;

@Repository("PreservationlistDao")
public class PreservationlistServiceImpl implements PreservationlistService {
	@Autowired
	private PreservationlistMapper map;
	
	@Override
	public List<PreservationlistVO> preservationlist() {
		return map.preservationlist();
	}

	@Override
	public List<PreservationCodeListVO> preservationCodeList() {
		return map.preservationCodeList();
	}

}
