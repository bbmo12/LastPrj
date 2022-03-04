package com.last.prj.pmember.service;

import lombok.Data;

@Data
public class TimeVOList {
	
	private int[] o_no;			//순번
	private String[] p_id;			//파트너회원아이디
	private String[] w_day;		//요일
	private String[] starttime;	//시작시간
	private String[] endtime;		//종료시간
	private String[] n_content;	//내용

}
