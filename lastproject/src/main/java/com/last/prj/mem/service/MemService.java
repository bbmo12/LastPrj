package com.last.prj.mem.service;

public interface MemService {
	
	MemVO memberSelect(MemVO member);
	
	MemVO memberIdSearch(String name, String tel);
}
