package com.last.prj.fallow.service;

import lombok.Data;

@Data
public class FollowVO {
	private int follow_no;
	private String m_id;	//회원아이디
	private String p_id;	//파트너회원아이디
	
	private String picture; //파티너회원사진
	private String pfile;
}
