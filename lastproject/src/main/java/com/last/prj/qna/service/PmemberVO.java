package com.last.prj.qna.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.last.prj.pmember.service.TimeVO;

import lombok.Data;




@Data
public class PmemberVO {
	private String p_id;				//파트너회원아이디
	private String name;			//이름
	private String tel;				//전화번호
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date startdate;			//가입일
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date enddate;			//탈퇴일
	private String password;		//비밀번호
	private int	c_report;			//신고당한횟수
	private String n_content;		//자기소개
	private String w_name;			//사업장이름
	private String w_address;		//사업장주소
	private String w_tel;			//사업자 전화번호
	private String p_info;			//이용안내
	private String w_d_address;		//사업장상세주소
	private String businessnumber;	//사업자번호?
	private String career;			//대표경력
	private String speciality;			//전문분야
	private int rcom;				//추천
	private int code;				//서비스 구분코드
	private Integer p_profile;			//프로필사진
	private Integer p_license;			//경력사진
	private Integer p_image;			
	
	private String picture;
	private String w_write;
	private Integer f_part;
	private List<TimeVO> timeList;

	//관리자
	private String f_content; //서비스 구분 코드 내용
}
