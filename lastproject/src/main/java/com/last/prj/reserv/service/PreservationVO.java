package com.last.prj.reserv.service;


import lombok.Data;

@Data
public class PreservationVO {
	private String startdate;
	private int r_no;
	private String r_date; //예약신청일
	private String time;
	private String m_id;
	private String pcontent;
	private String rcontent;
	private String rccontent;
	private String p_id;
	private String rd_date;
}
