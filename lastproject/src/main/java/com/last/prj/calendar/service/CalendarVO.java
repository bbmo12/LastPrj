package com.last.prj.calendar.service;



import lombok.Data;

@Data
public class CalendarVO {
	private int id;
	private String calendarid;
	private String c_start;
	private String c_end;
	private String category;
	private String title;
	private String p_id;
	private String c_time;
	private String bgColor;
}
