package com.last.prj.mem.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.mem.service.MemMapper;
import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;


@Repository("memDao")
public class MemServiceImpl implements MemService {

	@Autowired
	private MemMapper map;
	
	//일반회원 로그인
	@Override
	public MemVO memberSelect(MemVO member) {
		return map.memberSelect(member);
	}
	
	//일반회원 아이디 찾기
	@Override
	public MemVO memberIdSearch(String name, String tel) {
		return map.memberIdSearch(name, tel);
	}

	


}
