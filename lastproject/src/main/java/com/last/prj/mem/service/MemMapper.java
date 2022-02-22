package com.last.prj.mem.service;

public interface MemMapper {

	MemVO memberSelect(MemVO member);
	
	MemVO memberIdSearch(String name, String tel);

}
