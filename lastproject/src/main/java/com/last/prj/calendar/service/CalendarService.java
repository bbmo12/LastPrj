package com.last.prj.calendar.service;

import java.util.List;

public interface CalendarService {
	
	//파트너회원 예약설정
	List<CalendarVO> revSetList(CalendarVO cal);
	
	//파트너회원 등록 후 단건조회
	CalendarVO revSetSelectList();
	
	//파트너회원 예약일정 등록
	int revSetInsert(CalendarVO cal);
	
	//파트너회원 예약일정 수정
	int revSetUpdate(CalendarVO cal);
	
	//파트너회원 예약일정 단건조회
	CalendarVO revSetUpdateSelect(int id);
	
	//파트너회원 예약일정 삭제
	int revSetDelete(CalendarVO cal);
	
}
