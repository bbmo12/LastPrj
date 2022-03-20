package com.last.prj.mem.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.last.prj.pmember.service.PmemberVO;

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
	
	boolean isIdCheck(String id);
	
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
	
	public List<MemVO> admMlistCode(MemVO vo);
	public int adMmemCount(MemVO vo); 
	List<MemVO> admMemChart();
	
	public List<MemVO> admMemReporCode(MemVO vo);
	public int admMemReportCount(); 

	public MemVO getmemberinfo(String m_id);//member 정보
	
	public String passCheck(String m_id);
}
