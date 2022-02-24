package com.last.prj.pet.service;

import org.apache.ibatis.annotations.Param;

public interface PetService {
	
	//펫넘버로 펫 정보 조회
	PetVO petOne(@Param("pet_no") int pet_no);
}
