package com.last.prj.reserv.service;




import lombok.Data;

			//예약
@Data
public class ReservationVO {
	private int r_no;
	private String name;
	private String r_date;
	private String startdate;
	private String time;
	private int code; //코드번호
	private String r_code;
	private String rcontent; //예약내용
	private String rccontent; //예약승인코드
	private String pcontent; //품종코드
	private String refuse;
	private String p_id;
	private int pet_no;
	private String m_id;
	private int r_check;
	
	private int rev_no;			//후기순번
	private String content;		//후기내용
	private String rating;		//평점
	
	private int f_part;			//첨부파일
	
	 
	
}
