package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;



@Data
public class MemVO {

	private String mId;			//회원아이디
	private String password;	//비밀번호
	private String name;		//이름
	private String tel;			//회원전화번호
	private Date startDate;		//가입일
	private Date endDate;		//탈퇴일
	private int cReport;		//신고당한횟수
	private int fPart;			//첨부파일
}
	
