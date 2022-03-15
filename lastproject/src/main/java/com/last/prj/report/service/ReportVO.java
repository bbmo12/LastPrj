package com.last.prj.report.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;

import lombok.Data;



@Data
public class ReportVO {
	
	
	private int rep_no; 			//신고 번호
	private String reporter; 		// 신고한 
	@DateTimeFormat(pattern = "YY-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date w_date; 			//신고한 날짜
	private String content;			 // 왜 신고 했는 지 
	private int rev_no; 			//신고당한 review의 번호
	private int q_no; 				//신고당한 QnA의 번호
	private String reported; 		//신고당한사람의  이메일 
	private Integer code;  				//신고 코드
	
	private int count;  			//신고 건수
	private String f_content; 		//신고 코드 유형

	private String part;            //신고당한 게시글 유형
	private int repor; 				//신고 처리 code : 701 : 신고대기 / 702 : 신고기각 / 703 : 신고승인
	private String p_name;
	private String q_content; 		//신고 당한 QnA 내역 
	private String state;           //신고 처리 사유
	private String rev_content;     //신고 당한 review 내역
	
	private String fromDate;        //신고 날짜 검색
	private String toDate;			//신고 날짜 검색

	//페이징 처리
	private PagingVO vo;
	private Criteria cri;
	private String total;

	private String id;
	private Integer role;

}
