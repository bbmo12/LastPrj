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
	public List<ReservationVO> reservationSelect(ReservationVO vo) {
		return map.reservationSelect(vo);
	}
	@Override
	public List<ReservationVO> reservationSelectList() {
		return map.reservationSelectList();
	}
	@Override
	public int okUpdate(int res) {
		return map.okUpdate(res);
	}
	@Override
	public int noUpdate(int rno, String refuse) {
		return map.noUpdate(rno, refuse);
	}
	@Override
	public int payUpdate(int res) {
		
		return map.payUpdate(res);
	}
	@Override
	public int reservInsert(ReservationVO vo) {
		return map.reservInsert(vo);
	}
	@Override
	public int diaCodeUpdate(int res) {
		return map.diaCodeUpdate(res);
	}

}
