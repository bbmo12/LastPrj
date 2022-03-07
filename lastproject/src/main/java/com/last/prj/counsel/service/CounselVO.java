package com.last.prj.counsel.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CounselVO {

	
	private int c_no;		//상담순번
	private String content;	//상담내용
	private String result;	//상담결과
	@JsonFormat(pattern =  "yyyy-MM-dd")
	private Date w_date;		//작성일자
	private String p_id;		//파트너회원아이디
	private int pet_no;		//반려동물순번
	private int code;		//상담상태코드
	private String r_check; //후기 작성 여부
	
	private String p_name; //반려동물이름
	private String co_content; //코드내용
	private String pm_name; //파트너회원 이름

	private String m_id;
}
