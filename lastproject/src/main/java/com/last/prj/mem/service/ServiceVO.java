package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//서비스
@Data
public class ServiceVO {
	private int sNo;		//서비스순번
	private String content; //서비스내용
	private Date StratDate; //서비스시작일
	private Date endDate;	//서비스종료일
	private String pId;		//파트너회원 아이디
	private int code;		//서비스 구분코드
	private int price;		//금액
}
