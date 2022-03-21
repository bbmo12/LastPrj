package com.last.prj.qtag.service;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class QnaTagVO {
	private int q_no;
	private String t_name;
	
	private List<QtagVO> nTags;
}
