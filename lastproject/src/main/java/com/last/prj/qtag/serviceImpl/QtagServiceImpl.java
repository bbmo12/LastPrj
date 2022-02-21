package com.last.prj.qtag.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.qna.service.QnaMapper;
import com.last.prj.qna.service.QtagVO;
import com.last.prj.qtag.service.QtagMapper;
import com.last.prj.qtag.service.QtagService;

@Repository("qtagDAO")
public class QtagServiceImpl implements QtagService{

	@Autowired
	private QtagMapper qmap;

	@Override
	public List<QtagVO> tagList() {
		// TODO Auto-generated method stub
		return qmap.tagList();
	}
}
