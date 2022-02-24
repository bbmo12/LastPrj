package com.last.prj.qna.service;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.last.prj.report.service.ReportVO;

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
	private List<QnaTagVO> tagList;
	
	//DB에 없음
	private String searchType; //카테고리
	private String searchValue; //검색값
	private int recnt; //질문에 달린 답변 수
	
	private QnaTagVO QnaTagVO;
	private ReportVO reportVO;
	
}
