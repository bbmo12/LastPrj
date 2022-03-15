package com.last.prj.reserv.service;

import lombok.Data;

@Data
public class ReviewVO {
	private int rev_no;			//후기순번
	private String content;		//후기내용
	private String rating;		//평점
	private int c_no;			//상담순번
	private int r_no;			//예약순번
	private int fPart;			//첨부파일
}