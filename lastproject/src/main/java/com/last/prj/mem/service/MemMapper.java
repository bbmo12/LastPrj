package com.last.prj.mem.service;

import org.apache.ibatis.annotations.Param;

public interface MemMapper {

	MemVO memberSelect(MemVO member);

	String memberIdSearch(@Param("name") String name, @Param("tel") String tel);

	// 아이디로 멤버 정보 조회
	MemVO memberOne(@Param("m_id") String m_id);
}
