package com.last.prj.qtag.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.qtag.service.QnaTagMapper;
import com.last.prj.qtag.service.QnaTagService;
import com.last.prj.qtag.service.QnaTagVO;

@Repository("qtDAO")
public class QnaTagServiceImpl implements QnaTagService{

	@Autowired
	private QnaTagMapper qtmap;
	
	@Override
	public List<QnaTagVO> qtList() {
		// TODO Auto-generated method stub
		return qtmap.qtList();
	}

	@Override
	public int delTags(int q_no) {
		// TODO Auto-generated method stub
		return qtmap.delTags(q_no);
	}


}
