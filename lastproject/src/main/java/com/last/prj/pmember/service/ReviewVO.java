package com.last.prj.pmember.service;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int rev_no;			//후기순번
	private String content;		//후기내용
	private String rating;		//평점
	private int c_no;			//상담순번
	private int f_part;			//첨부파일
	private int r_no;			//예약순번
	private int r_check; 		//후기작성 완료여부

	private int pet_no; //펫 순번
	private String m_id; //회원 id
	private String p_id; //파트너id
	
}
