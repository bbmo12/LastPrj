package com.last.prj.reserv.service;


import java.sql.Date;

import lombok.Data;

			//예약
@Data
public class ReservationVO {
	private int r_no;		//예약순번
	private Date r_date;		//예약일
	private String content;	//예약내용
	private int code;		//승인상태코드
	private int pet_no;		//반려동물 순번
	private int time;		//예약시간
	private int sNo;		//서비스순번
	private String p_id;		//파트너아이디
}
