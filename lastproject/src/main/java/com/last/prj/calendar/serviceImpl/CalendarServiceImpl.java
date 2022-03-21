package com.last.prj.calendar.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.calendar.service.CalendarMapper;
import com.last.prj.calendar.service.CalendarService;
import com.last.prj.calendar.service.CalendarVO;

@Repository("CalendarDao")
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarMapper map;
	
	@Override
	public List<CalendarVO> revSetList(CalendarVO cal) {
		return map.revSetList(cal);
	}

	@Override
	public int revSetInsert(CalendarVO cal) {
		return map.revSetInsert(cal);
	}

	@Override
	public int revSetUpdate(CalendarVO cal) {
		return map.revSetUpdate(cal);
	}

	@Override
	public int revSetDelete(CalendarVO cal) {
		return map.revSetDelete(cal);
	}

	@Override
	public CalendarVO revSetSelectList() {
		return map.revSetSelectList();
	}

	@Override
	public CalendarVO revSetUpdateSelect(int id) {
		return map.revSetUpdateSelect(id);
	}

	

}
