package com.last.prj.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReservCountService {
	
	List<ReservCountVO> reservCountList();
	
	ReservCountVO reservCountSelect(@Param("reserv_date")String reserv_date,@Param("reserv_time")String reserv_time);
	
	int reservCountInsert(ReservCountVO no);
	
	
}
