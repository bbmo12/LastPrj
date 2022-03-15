package com.last.prj.diagnosis.service;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;

import lombok.Data;

@Data
public class DiagnosisVO {
	private int r_no;		//예약번호
	private String r_date; //예약날짜
	private String d_name; //진단명
	private String result; //처방
	private String symptom; //증상
	private String w_date; //진료기록날짜
	
	
	private String pet_name; 
	private String p_id;
	
	private String m_id;
	private PagingVO vo;
	private Criteria cri;
	private String total;
}
