package com.last.prj.pet.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.service.service.ServiceVO;

public interface PetMapper {
	// 펫넘버로 펫 정보 조회
	PetVO petOne(@Param("pet_no") int pet_no);
	// 펫 상세정보 조회
	PetVO petSearch(@Param("pet_no") int pet_no);
	
	//일반회원 아이디로 반려동물 조회
	List<PetVO> petmemberList(@Param("m_id") String m_id);
	
	int mypetInsert(PetVO pet);
	
	//펫 상세정보 조회(코드중복제거)
	List<PetVO> petCodeSearch(@Param("m_id") String m_id); 
	
	//펫 수
	int petCount();

	int mypetupdate(PetVO pet);
	int updatecode(ReservationVO vo);
	int mypetDelete(@Param("pet_no") int pet_no);

}
