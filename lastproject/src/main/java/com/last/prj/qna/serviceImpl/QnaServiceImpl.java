package com.last.prj.qna.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.qna.service.Criteria;
import com.last.prj.qna.service.PagingVO;
import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaService;
import com.last.prj.qna.service.QnaTagVO;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qna.service.QtagVO;

@Repository("qnaDAO")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper map;

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return map.getTotal();
	}
	
	@Override
	public List<QnaVO> qnaList(Criteria cri) {
		// TODO Auto-generated method stub
		return map.qnaList(cri);
	}

	@Override
	public QnaVO qnaDetail(QnaVO qna) {
		// TODO Auto-generated method stub
		return map.qnaDetail(qna);
	}

	@Override
	public QnaVO ansDetail(QnaVO qna) {
		// TODO Auto-generated method stub
		return map.ansDetail(qna);
	}

	@Override
	public List<QnaTagVO> hashtag(int q_no) {
		// TODO Auto-generated method stub
		return map.hashtag(q_no);
	}

	@Override
	public int postCnt(int q_no) {
		// TODO Auto-generated method stub
		return map.postCnt(q_no);
	}


	@Override
	public int newQna(QnaVO qna) {
		// TODO Auto-generated method stub
		return map.newQna(qna);
	}

	@Override
	public int newAns(QnaVO qna) {
		// TODO Auto-generated method stub
		return map.newAns(qna);
	}

	@Override
	public int replyCnt(int q_no) {
		// TODO Auto-generated method stub
		return map.replyCnt(q_no);
	}



}
