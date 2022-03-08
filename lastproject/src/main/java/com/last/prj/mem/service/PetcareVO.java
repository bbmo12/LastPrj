package com.last.prj.mem.service;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PetcareVO {
	private int care_no;	//순번
	private String p_id;	//파트너회원아이디
	private int code;	//품종코드
	
	private List<PetcareVO> petcareVOList;
}
