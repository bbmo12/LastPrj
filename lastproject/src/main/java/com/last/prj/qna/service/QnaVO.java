package com.last.prj.qna.service;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class QnaVO {
	private int q_no;
	private String w_date;
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
	
}
