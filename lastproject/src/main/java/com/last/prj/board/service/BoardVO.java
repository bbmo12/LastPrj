package com.last.prj.board.service;


import java.sql.Date;

import lombok.Data;


@Data
public class BoardVO {

	private int b_no;
	private String title;
	private String content;
	private String writer;
	private Date w_date;
	
	
	//private int notice_hit
	

}