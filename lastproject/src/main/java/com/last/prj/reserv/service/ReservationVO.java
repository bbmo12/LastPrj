package com.last.prj.reserv.service;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

			//예약
@Data
public class ReservationVO {
	private int r_no;
	private String name;
	private String r_date;
	private String startdate;
	private String time;
	private String rcontent; //예약내용
	private String rccontent; //예약승인코드
	private String pcontent; //품종코드
	private String refuse;
	
	
	
	 
	
}
