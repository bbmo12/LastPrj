package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

			//알림
@Data
public class NoticeVO {
	private int noticeNo;	//알림순번
	private String nFrom;	//수신자
	private String nTo;		//송신자
	private String content; //내용
	private Date wDate;		//일시
	private int rCheck;		//읽음여부
}
