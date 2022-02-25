package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface PmemMapper {
	
	PmemVO pmemberSelect(PmemVO pmember);
	

	String pmemberIdSearch(@Param("name") String name, @Param("tel") String tel);
	int pmemberInsert1(PmemVO pmember);

	//아이디로 멤버 정보 조회
	MemVO memberOne (MemVO member);
	
	int pmemberInsert2(PmemVO pmember);

}
