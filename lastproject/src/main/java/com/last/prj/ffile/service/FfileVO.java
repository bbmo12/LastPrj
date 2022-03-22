package com.last.prj.ffile.service;

import lombok.Data;

@Data
public class FfileVO {
	private int f_no;		 //파일순번
	private String picture;	 //파일원본이미지
	private String pfile;	 //파일저장이미지
	private Integer f_part;
	private String w_write;	 //p_id

}
