package com.last.prj.mem.service;

import java.util.Date;

import lombok.Data;

//반려동물
@Data
public class PetVO {
	private int petNo;		//반려동물순번
	private String name;	//이름
	private Date birth;		//생년월일
	private int rCheck;		//중성화유무
	private int gender;		//성별
	private String mId;		//회원아이디
	private int code;		//품종코드
	private String weight;	//몸무게
	private String nContent;//메모
	private int fPart;		//첨부파일
}
