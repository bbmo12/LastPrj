package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface MemService {
	
	MemVO memberSelect(MemVO member);
	
	String memberIdSearch(@Param("name") String name, @Param("tel") String tel);
}