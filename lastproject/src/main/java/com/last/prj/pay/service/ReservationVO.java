package com.last.prj.pay.service;

import lombok.Data;

@Data
public class ReservationVO {
	private int rNo;		//예약순번
	private int petNo;		//반려동물 순번
	private String content;	//예약내용
	private String pId;		//파트너아이디
}
