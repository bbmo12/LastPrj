package com.last.prj.report.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {
	private int rep_no;
	private String reporter;
	@DateTimeFormat(pattern = "YY-MM-dd")
	private Date w_date;
	private String content;
	private int rev_no;
	private int q_no;
	private String reported;
	private int code;
}
