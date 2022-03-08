package com.last.prj.pmember.service;

import java.util.List;


public interface ReviewMapper {
	
	public List<ReviewVO> admReviewList();
	
	//서비스리뷰 등록
	int servicereview(ReviewVO review);

}
