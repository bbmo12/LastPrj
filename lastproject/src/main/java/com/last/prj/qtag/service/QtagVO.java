package com.last.prj.qtag.service;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class QtagVO {
	private String t_name;
	
	private List<QtagVO> nTags;
}
