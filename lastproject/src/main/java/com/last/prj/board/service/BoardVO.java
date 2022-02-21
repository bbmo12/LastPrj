package com.last.prj.board.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class BoardVO {

	private int b_no;
	private String title;
	private String content;
	private String writer;
	private Date w_date;

}
