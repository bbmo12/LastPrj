package com.last.prj.qna.service;

import java.util.List;

public interface QnaService {

	// 질문글 전체 갯수
	int getTotal(Criteria cri);

	// 질문글 전체 조회
	List<QnaVO> qnaList(Criteria cri);

	// 조회수 top 게시물
	List<QnaVO> qnaBest();

	// 질문글 개별 조회
	QnaVO qnaDetail(int q_no);

	// 조회수 증가
	int postCnt(int q_no);

	// 답변글 조회
	List<QnaVO> ansDetail(int q_no);

	// 태그를 통한 검색
	List<QnaTagVO> tagSearch(String t_name);

	// 질문글 작성
	int newQna(QnaVO qna);

	// 답변글 작성
	int newAns(QnaVO qna);

	// 답글 갯수
	int replyCnt(int q_no);

	// 질문글 수정

	// 답변글 수정

	// 답변글 삭제
	int ansDelete(int q_no);
}
