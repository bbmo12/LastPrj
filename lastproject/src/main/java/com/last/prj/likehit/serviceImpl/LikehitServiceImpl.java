package com.last.prj.likehit.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.likehit.service.LikehitMapper;
import com.last.prj.likehit.service.LikehitService;
import com.last.prj.likehit.service.LikehitVO;

@Repository("likehitDao")
public class LikehitServiceImpl implements LikehitService{
	
	@Autowired
	private LikehitMapper map;
	
	@Override
	public int insertLike(LikehitVO hit) {
		return map.insertLike(hit);
	}

	@Override
	public int deleteLike(LikehitVO hit) {
		return map.deleteLike(hit);
	}

}
