package com.last.prj.reserv.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.reserv.service.ReservationMapper;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;

@Repository("reservationDao")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
		private ReservationMapper map;
	@Override
	public List<ReservationVO> reservationSelect() {
		return map.reservationSelect();
	}
	@Override
	public List<ReservationVO> reservationSelectList() {
		return map.reservationSelectList();
	}
	@Override
	public int okUpdate(ReservationVO res) {
		return map.okUpdate(res);
	}

}
