package com.last.prj.reserv.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PreservationVO {
	private String startdate;
	//뷰
	private int r_no;
	private String r_date;
	private int time;
	private String m_id;
	private String pcontent;
	private String rcontent;
	private String rccontent;
	private String p_id;
}
