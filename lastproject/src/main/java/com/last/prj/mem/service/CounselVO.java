package com.last.prj.mem.service;

import java.sql.Date;

import lombok.Data;
			//상담
@Data
public class CounselVO {
	private int cNo;		//상담순번
	private String content;	//상담내용
	private String result;	//상담결과
	private Date wDate;		//작성일자
	private String pId;		//반려동물순번
	private int petNo;		//파트너회원아이디
	private int code;		//상담상태코드
}
