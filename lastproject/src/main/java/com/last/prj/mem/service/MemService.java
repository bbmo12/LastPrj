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

	//회원탈퇴버튼클릭
	int memberDelete(@Param("m_id") String m_id);
	
	
	//아이디 중복체크(카카오로그인)
	boolean idCheck(String m_id);
	
	//회원가입 아이디 중복체크
	boolean isIdCheck(String m_id);
	
}