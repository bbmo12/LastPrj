package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//진단
@Data
public class DiagnosisVO {
	private int rNo;		//예약순번
	private String dName;	//진단명
	private String result;	//결과
	private String symptom;	//증상
	private Date wDate;		//진료일자
}
