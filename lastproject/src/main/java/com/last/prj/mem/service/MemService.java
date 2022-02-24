package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface MemService {
	
	//멤버 로그인
	MemVO memberSelect(MemVO member);
	
	//멤버 id찾기
	String memberIdSearch(@Param("name") String name, @Param("tel") String tel);
	
	//멤버회원가입
	int memberInsert(MemVO member);
}