package com.last.prj.qtag.service;

import java.util.List;

public interface QnaTagMapper {
	// 질문글별 태그 목록
	List<QnaTagVO> qtList();

	// 글과 연결.
	int newQtag(QnaTagVO qnatag);
}
