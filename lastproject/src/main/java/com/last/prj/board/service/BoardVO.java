package com.last.prj.board.service;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardVO {

	private int b_no;
	private String title;
	private String content;
	private String writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date w_date;
	private String key;	

}