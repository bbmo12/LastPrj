package com.last.prj.qna.service;

import java.util.List;

public interface QnaService {
	//질문글 전체 조회
		List<QnaVO> qnaList(QnaVO qna);
		
		//질문글 개별 조회
		QnaVO qnaDetail(QnaVO qna);
		
		//답변글 조회
		QnaVO ansDetail(QnaVO qna);
		
		//포스트별 해시태그
		List<QnaTagVO> hashtag(QnaTagVO qna);
		
		//조회수 증가
		int postCnt(int q_no);
		
		//인기 태그 목록
		List<QtagVO> tagList(QtagVO qtag);
		
		//검색
		
		//질문글 작성
		int newQna(QnaVO qna);
		
		//답변글 작성
		int newAns(QnaVO qna);
		
		//질문글 수정
		
		//답변글 수정
		
		//태그 클릭 시 관련글
}
