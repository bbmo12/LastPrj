package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//신고내역
@Data
public class ReportVO {
	private int repNo;		 //신고순번
	private String reporter; //신고자
	private String reported; //피신고자
	private Date wDate;		 //신고일시
	private String content;	 //신고내용
	private int rev_no;		 //후기순번
	private int oNo;		 //QnA순번
	private int code;		 //신고처리상태
}
