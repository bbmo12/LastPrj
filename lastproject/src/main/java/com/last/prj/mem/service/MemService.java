package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface MemService {
	
	//멤버 상세조회
	MemVO memberSearch(String m_id);
	
	//멤버 로그인
	MemVO memberSelect(MemVO member);
	
	//멤버 id찾기
	String memberIdSearch(@Param("name") String name, @Param("tel") String tel);
	

	//멤버회원가입(1차)
	int memberInsert(MemVO member);
	

	//아이디로 멤버 정보 조회
	MemVO memberOne(@Param("m_id") String m_id);
	
	//회원정보수정
	int memberUpdate(MemVO member);

}