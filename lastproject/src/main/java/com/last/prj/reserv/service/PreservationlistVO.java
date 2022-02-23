package com.last.prj.reserv.service;

import java.sql.Date;

import lombok.Data;

@Data
public class PreservationlistVO {
	//뷰
	private Date startdate;
	private Date r_date;
	private int time;
	private String m_id;
	private String content;
	private String d_name;
	private String p_id;
}
