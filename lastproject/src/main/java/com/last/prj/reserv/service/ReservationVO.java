package com.last.prj.reserv.service;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

			//예약
@Data
public class ReservationVO {
	@JsonFormat(pattern = "yyyy-MM-dd")
	private String name;
	private Date startdate;
	private String time;
	private String content;
	private String code;
	private Date r_date;
	
	
	
	 
	
}
