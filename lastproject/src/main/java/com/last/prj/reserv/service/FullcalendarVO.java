package com.last.prj.reserv.service;

import java.sql.Date;

import lombok.Data;

@Data
public class FullcalendarVO {
	private String title;
	private String m_id;
	private String p_id;
	private String pet_no;
	private Date start;
	private Date end;
}
