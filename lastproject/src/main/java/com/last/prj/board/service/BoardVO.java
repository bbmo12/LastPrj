package com.last.prj.board.service;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;




@Data
public class BoardVO {

	private int b_no;
	private String title;
	private String content;
	private String writer;
	@JsonFormat(pattern ="yy-mm-dd")
	private Date w_date;
	

}