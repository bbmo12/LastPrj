package com.last.prj.pmember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.ReviewMapper;
import com.last.prj.pmember.service.ReviewService;
import com.last.prj.pmember.service.ReviewVO;

@Repository("reviewDao")
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewMapper map;
	
	@Override
	public List<ReviewVO> admReviewList() {
		return map.admReviewList();
	}

	@Override
	public int servicereview(ReviewVO review) {
		return map.servicereview(review);
	}

}
