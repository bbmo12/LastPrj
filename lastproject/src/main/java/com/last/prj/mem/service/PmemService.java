package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface PmemService {
	//파트너회원 로그인
	PmemVO pmemberSelect(PmemVO pmember);

	//파티너회원 id 찾기
	String pmemberIdSearch(@Param("name") String name, @Param("tel") String tel);
}
