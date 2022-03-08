package com.last.prj.mem.service;

import java.util.List;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TimeVO {
	private int o_no;			//순번
	private String p_id;			//파트너회원아이디
	private String w_day;		//요일
	private String starttime;	//시작시간
	private String endtime;		//종료시간
	private String n_content;	//내용

	private List<TimeVO> timeListVO;
}
