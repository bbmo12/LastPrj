package com.last.prj.mem.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PmemService {
	//파트너회원 로그인
	PmemVO pmemberSelect(PmemVO pmember);

	//파티너회원 id 찾기
	String pmemberIdSearch(@Param("name") String name, @Param("tel") String tel);
	
	//파티너회원 1차회원가입
	int pmemberInsert1(PmemVO pmember);
	
	int pmemberInsert2(PmemVO pmember);
	
	int pmemberInsert3(String p_id, int p_license, int p_image);
	
	boolean isIdCheck(String p_id);
	List<PriceVO> getPrice(String p_id);
	int deleteService(PriceVO price);
	int insertService(PriceVO price);
	int updateService(PriceVO price);
}
