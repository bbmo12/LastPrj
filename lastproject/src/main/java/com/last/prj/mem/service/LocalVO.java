package com.last.prj.mem.service;

import lombok.Data;
			
			//방문지역
@Data
public class LocalVO {
	private int vNo;	//방문지역순번
	private String pId;	//파트너회원아이디
	private String lName;	//지역코드
}
