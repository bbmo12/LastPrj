package com.last.prj.qtag.service;

import java.util.List;

public interface QnaTagService {

	// 질문글별 태그 목록
	List<QnaTagVO> qtList();

	//새로운 태그와 글 번호 연결
	int newQtag(QnaTagVO qnatag);
	
	// 질문에 달린 태그 삭제
	int delTags(int q_no);
}
