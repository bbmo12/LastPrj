package com.last.prj.mem.service;

public interface PmemMapper {
	
	PmemVO pmemberSelect(PmemVO pmember);
	
	//아이디로 멤버 정보 조회
	MemVO memberOne (MemVO member);
}
