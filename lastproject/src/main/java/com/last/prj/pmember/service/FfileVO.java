package com.last.prj.pmember.service;

import lombok.Data;

@Data
public class FfileVO {
	private int f_no;		 //파일순번
	private String picture;	 //파일원본이미지
	private String pfile;	 //파일저장이미지
	private int f_part;
	
	private String p_id;
	private int p_license;			//경력사진
	private int p_image;	
	private String photo;
	
}
