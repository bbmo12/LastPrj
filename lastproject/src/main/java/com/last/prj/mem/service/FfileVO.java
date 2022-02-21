package com.last.prj.mem.service;

import lombok.Data;
		
			//파일
@Data
public class FfileVO {
	private int fNo;		 //파일순번
	private String picture;	 //파일원본이미지
	private String pfile;	 //파일저장이미지
	private String fContent;	 //파일내용
	private int fPart;	 //첨부파일
}
