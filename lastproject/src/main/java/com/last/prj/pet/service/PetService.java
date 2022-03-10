package com.last.prj.pet.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PetService {
	
	//펫넘버로 펫 정보 조회
	PetVO petOne(@Param("pet_no") int pet_no);
	
	//펫 상세정보 조회
	PetVO petSearch(@Param("pet_no") int pet_no);
	
	//일반회원 아이디로 반려동물 조회
	List<PetVO> petmemberList(@Param("m_id") String m_id);

	//펫등록
	int mypetInsert(PetVO pet);
	
	//펫 상세정보 조회(코드중복제거)
	List<PetVO> petCodeSearch(@Param("m_id") String m_id);
	
	//펫 수
	int petCount();
	
	//펫 검색 찾기
	List<PetVO> petProtoColSearch(@Param("key")String key, @Param("data")String data, @Param("m_id")String m_id);
	
}