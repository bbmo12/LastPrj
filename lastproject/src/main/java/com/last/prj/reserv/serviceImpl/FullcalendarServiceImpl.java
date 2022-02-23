package com.last.prj.reserv.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.reserv.service.FullcalendarMapper;
import com.last.prj.reserv.service.FullcalendarService;
import com.last.prj.reserv.service.FullcalendarVO;
import com.last.prj.reserv.service.ReservationMapper;

@Repository("FullcalendarDao")
public class FullcalendarServiceImpl implements FullcalendarService {
	
	@Autowired
	private FullcalendarMapper map;
	
	@Override
	public int insertCalendar(FullcalendarVO cal) {
		return map.insertCalendar(cal);
	}

	@Override
	public int deleteCalendar(FullcalendarVO cal) {
		return map.deleteCalendar(cal);
	}

	@Override
	public int updateCalendar(FullcalendarVO cal) {
		return map.updateCalendar(cal);
	}

}
