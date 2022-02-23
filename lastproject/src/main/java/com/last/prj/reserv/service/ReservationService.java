package com.last.prj.reserv.service;

import java.util.List;

public interface ReservationService {
	List<ReservationVO> reservationSelectList();
	
	List<ReservationVO> reservationSelect ();
	
	int okUpdate(ReservationVO res);
}
