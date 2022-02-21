package com.last.prj.mem.service;

import lombok.Data;

			//후기
@Data
public class ReviewVO {
	private int revNo;			//후기순번
	private String content;		//후기내용
	private String rating;		//평점
	private int cNo;			//상담순번
	private int rNo;			//예약순번
	private int fPart;			//첨부파일
	private int rCheck;			//예약체크?
}
