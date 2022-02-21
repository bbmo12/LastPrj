package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//금액
@Data
public class PayVO {
	private int rNo; 		 //예약순번
	private int price; 		 //결제금액
	private Date wDate; 	 //결제일자
	private String cardANum; //카드승인번호
	private String id;		 //거래아이디
	private String token;	 //고유아이디
}
