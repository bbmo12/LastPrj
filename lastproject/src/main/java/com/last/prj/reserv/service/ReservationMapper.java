package com.last.prj.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReservationMapper {
	List<ReservationVO> reservationSelectList();
	
	List<ReservationVO> reservationSelect ();
	
	//예약승인
	int okUpdate(int res);
	
	//예약거절
	int noUpdate(@Param("rno")int rno,@Param("refuse")String refuse);
	
	//결제하기
	int payUpdate(int res);
	
}
