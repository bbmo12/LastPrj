package com.last.prj.pay.service;

import lombok.Data;

@Data
public class PayVO {
	private int r_no; 		 //예약순번
	private int price; 		 //결제금액
	private String w_date; 	 //결제일자
	private String cardANum; //카드승인번호
	private String id;	 //거래아이디
	private String token;	 //고유아이디
	
	private String p_name; //반려동물 이름 
	
	private String m_name; //일반회원 이름
	private String pm_name; //파트너회원이름
	private String content; //예약내용
	
	
}
