package com.last.prj.qtag.service;

import java.util.List;

import com.last.prj.qna.service.QtagVO;

public interface QtagMapper {

	// 인기 태그 목록
	List<QtagVO> tagList();
}
