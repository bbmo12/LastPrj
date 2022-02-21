package com.last.prj.reserv.service;

import java.util.List;

public interface ReservationService {
	List<ReservationVO> reservationSelectList();
	
	ReservationVO reservationSelect (ReservationVO res);
}
