package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//파트너회원
@Data
public class PmemberVO {
	private String pId;				//파트너회원아이디
	private String name;			//이름
	private String tel;				//전화번호
	private Date startdate;			//가입일
	private Date enddate;			//탈퇴일
	private String password;		//비밀번호
	private int	cReport;			//신고당한횟수
	private String nContent;		//자기소개
	private String wName;			//사업장이름
	private String wAddress;		//사업장주소
	private String wDAddress;		//사업장상세주소
	private String wTel;			//사업자 전화번호
	private String pInfo;			//이용안내
	private String businessNumber;	//사업자번호
	private String career;			//대표경력
	private String speciality;			//전문분야
	private int rcom;				//추천
	private int code;				//서비스 구분코드
	private int pProfile;			
	private int pLicense; 				
	private int pImage	;			
	
}
