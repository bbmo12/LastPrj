package com.last.prj.qtag.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QnaVO;
import com.last.prj.qtag.service.QtagVO;
import com.last.prj.qtag.service.QnaTagMapper;
import com.last.prj.qtag.service.QnaTagVO;
import com.last.prj.qtag.service.QtagMapper;
import com.last.prj.qtag.service.QtagService;

@Repository("qtagDAO")
public class QtagServiceImpl implements QtagService{

	@Autowired
	private QtagMapper qmap;
	
	@Autowired
	private QnaTagMapper qtmap;

	@Override
	public List<QtagVO> tagList() {
		// TODO Auto-generated method stub
		return qmap.tagList();
	}


	@Override
	public int newTag(QtagVO qtag) {
		// TODO Auto-generated method stub
		for(QtagVO vo:qtag.getNTags()) {
			qmap.newTag(vo);
		}
		return 1;
	}
}
