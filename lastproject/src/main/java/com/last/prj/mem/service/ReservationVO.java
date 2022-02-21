package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//예약
@Data
public class ReservationVO {
	private int rNo;		//예약순번
	private Date rDate;		//예약일
	private String content;	//예약내용
	private int code;		//승인상태코드
	private int petNo;		//반려동물 순번
	private int time;		//예약시간
	private int sNo;		//서비스순번
	private String pId;		//파트너아이디
}
