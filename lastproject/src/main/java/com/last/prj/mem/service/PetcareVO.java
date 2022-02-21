package com.last.prj.mem.service;
import lombok.Data;

			//진료및 케어가능동물
@Data
public class PetcareVO {
	private int careNo;	//순번
	private String pId;	//파트너회원아이디
	private int code;	//품종코드
}
