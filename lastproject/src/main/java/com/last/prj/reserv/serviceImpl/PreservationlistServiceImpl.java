package com.last.prj.reserv.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.reserv.service.PreservationlistMapper;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.preservationlistVO;

@Repository("PreservationlistDao")
public class PreservationlistServiceImpl implements PreservationlistService {
	@Autowired
	private PreservationlistMapper map;
	
	@Override
	public List<preservationlistVO> preservationlist() {
		return map.preservationlist();
	}

}
