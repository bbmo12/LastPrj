package com.last.prj.qtag.service;

import java.util.List;

public interface QtagMapper {

	// 인기 태그 목록
	List<QtagVO> tagList();

	// 등록
	int newTag(QtagVO qtag);

}
