package com.last.prj.reserv.service;

import java.sql.Date;

import lombok.Data;

@Data
public class PreservationVO {
	//뷰
	private int r_no;
	private Date startdate;
	private Date r_date;
	private int time;
	private String m_id;
	private String pcontent;
	private String rcontent;
	private String rccontent;
	private String p_id;
}
