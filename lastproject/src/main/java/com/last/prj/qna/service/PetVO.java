package com.last.prj.qna.service;

import java.sql.Date;

import lombok.Data;

@Data
public class PetVO {
	
	private int pet_no;
	private String name;
	private Date birth;
	private int r_check;
	private int gender;
	private String m_id;
	private int code;
	private int f_part;
	private int weight;
	private String n_content;
	private String picture;
	private String pfile;
	private int age;
}
