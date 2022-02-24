package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface PmemMapper {
	
	PmemVO pmemberSelect(PmemVO pmember);
	
	String pmemberIdSearch(@Param("name") String name, @Param("tel") String tel);
	int pmemberInsert1(PmemVO pmember);
}
