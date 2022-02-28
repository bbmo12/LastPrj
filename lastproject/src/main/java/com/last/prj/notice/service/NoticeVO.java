package com.last.prj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private String n_to;
	private String n_from;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date w_date;
	private int r_check;
}
