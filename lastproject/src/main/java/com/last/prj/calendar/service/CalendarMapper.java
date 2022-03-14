package com.last.prj.calendar.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CalendarMapper {
	//파트너회원 예약설정
	List<CalendarVO> revSetList(CalendarVO cal);
	
	//파트너회원 예약일정 등록
	int revSetInsert(CalendarVO cal);
	//파트너회원 등록 후 단건조회
	CalendarVO revSetSelectList();
	
	//파트너회원 예약일정 수정
	int revSetUpdate(CalendarVO cal);
	//파트너회원 예약일정 단건조회
	List<CalendarVO> revSetUpdateSelect(int id);
	
	//파트너회원 예약일정 삭제
	int revSetDelete(CalendarVO cal);
	
	//현재날짜 비교해서 업데이트
	void yyyy(@Param("title") String title,@Param("bgColor") String bgColor);
}
