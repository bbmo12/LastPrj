package com.last.prj.reserv.service;

import java.util.List;

public interface ReservationMapper {
	List<ReservationVO> reservationSelectList();
	
	ReservationVO reservationSelect (ReservationVO res);
	
}
