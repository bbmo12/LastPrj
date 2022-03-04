package com.last.prj.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReservCountService {
	
	List<ReservCountVO> reservCountList();
	
	ReservCountVO reservCountSelect(ReservCountVO vo);
	
	int reservCountInsert(ReservCountVO no);
	
	
}
