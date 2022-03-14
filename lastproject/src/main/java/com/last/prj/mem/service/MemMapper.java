package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface MemMapper {

	MemVO memberSelect(MemVO member);

	String memberIdSearch(@Param("name") String name, @Param("tel") String tel);
	
	int memberInsert(MemVO member);

	MemVO memberSearch(String m_id);
	
	// 아이디로 멤버 정보 조회
	MemVO memberOne(@Param("m_id") String m_id);
	
	int memberUpdate(MemVO member);
	
	int memberDelete(@Param("m_id") String m_id);
	
	//아이디 중복체크
	boolean idCheck(String m_id);
	
	boolean isIdCheck(String m_id);
	
	//일반 회원 수
	int memCount();
	
	
	//서비스 가격 입력
	int servicepriceinsert(PriceVO price);
	
	//진료 가능한 동물
	int petcareinsert(PetcareVO petcare);
	
	
	public int otimeinsert(TimeVO time); //otime 입력
	
	// security login
	MemVO read(String username);
	

	// 비밀번호 찾기
	LoginVO searchPwd(String id);
	
	// 비밀번호 수정
	int memberPwdUpdate(MemVO mem);

	int memdelete();

}
