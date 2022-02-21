package com.last.prj.qna.service;

import java.util.List;

public interface QnaService {
	// 질문글 전체 조회
	List<QnaVO> qnaList();

	// 질문글 개별 조회
	QnaVO qnaDetail(QnaVO qna);

	// 답변글 조회
	QnaVO ansDetail(QnaVO qna);

	// 포스트별 해시태그
	List<QnaTagVO> hashtag(int p_no);

	// 조회수 증가
	int postCnt(int q_no);

	// 검색

	// 질문글 작성
	int newQna(QnaVO qna);

	// 답변글 작성
	int newAns(QnaVO qna);

	// 답글 갯수
	int replyCnt(int q_no);

	// 질문글 수정

	// 답변글 수정

	// 태그 클릭 시 관련글
}
