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

	//일반 회원 수
	int memCount();
	
	//서비스 가격 입력
	int servicepriceinsert(PriceVO price);
	
	//진료 가능한 동물
	int petcareinsert(PetcareVO petcare);
	
	
	public int otimeinsert(TimeVO time);
	
	// security login
	MemVO read(String username);
	
	// 비밀번호 찾기
	LoginVO searchPwd(String id);
	
	// 비밀번호 수정
	int memberPwdUpdate(MemVO mem);
}