package com.last.prj.qna.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class QnaVO {
	private int q_no;
	@DateTimeFormat(pattern = "YY-MM-dd")
	private Date w_date;
	private String title;
	private String content;
	private int hit;
	private String writer;
	private int p_no;
	private int f_part;
	private int pet_no;
	private int r_check;
	
	//DB에 없음
	private String searchType; //카테고리
	private String searchValue; //검색값
	
	private QnaTagVO qnatagvo;
	
}
