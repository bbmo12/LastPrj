package com.last.prj.reserv.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PreservationVO {
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Date startdate;
	//뷰
	private int r_no;
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Date r_date;
	private int time;
	private String m_id;
	private String pcontent;
	private String rcontent;
	private String rccontent;
	private String p_id;
}
