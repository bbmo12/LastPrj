package com.last.prj.mem.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.mem.service.PmemMapper;
import com.last.prj.mem.service.PmemVO;
import com.last.prj.mem.service.PmemService;

@Repository("pmemDao")
public class PmemserviceImpl implements PmemService {

	@Autowired
	private PmemMapper pmap;

	@Override
	public PmemVO pmemberSelect(PmemVO pmember) {
		return pmap.pmemberSelect(pmember);
	}

	@Override
	public String pmemberIdSearch(String name, String tel) {
		return pmap.pmemberIdSearch(name, tel);
	}
	
	

}
