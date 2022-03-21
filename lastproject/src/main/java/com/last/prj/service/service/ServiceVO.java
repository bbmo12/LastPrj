package com.last.prj.service.service;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;

import lombok.Data;

@Data
public class ServiceVO {
	private int r_no;		//서비스순번
	private String content; //서비스내용
	private String startdate; //서비스시작일
	private String enddate;	//서비스종료일
	private String p_id;		//파트너회원 아이디
	private Integer code;		//서비스 구분코드
	private int price;		//금액
	
	private String pm_name; //파트너회원 이름
	private String p_name; //반려동물 이름
	private String m_id;
	private int total_price;
	private Integer pm_code; //파트너회원 코드
	
	
	private PagingVO vo;
	private Criteria cri;
	private String total;
	private String key;
	private String data;
}
