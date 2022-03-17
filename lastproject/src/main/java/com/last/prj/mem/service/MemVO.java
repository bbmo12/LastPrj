package com.last.prj.mem.service;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;

import lombok.Data;





@Data
public class MemVO {

	private String m_id;			//회원아이디
	private String password;	//비밀번호
	private String name;		//이름
	private String tel;			//회원전화번호
	@JsonFormat(pattern =  "yyyy-MM-dd")
	private Date startDate;		//가입일
	private Date endDate;		//탈퇴일
	private int cReport;		//신고당한횟수

	private String picture; 	//프로필사진
	private String pfile;		//첨부파일
	
	private int m_role; // 권한
	
	private String id; //아이디중복조회 확인
	private List<AuthVO> authList;
	
	private String petY;
	private String petN;
	private String key;
	private String pets;
	private String data;
	private Integer pet_no;
	private String fromDate;
	private String toDate;
	private PagingVO vo;
	private Criteria cri;
	private String total;
	private String code;
}
	

