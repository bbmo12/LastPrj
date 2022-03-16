package com.last.prj.pmember.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ReviewService {

	public List<ReviewVO> admReviewList();
	
	//서비스리뷰 등록
	int servicereview(ReviewVO review);

	//후기 조회
	public ReviewVO reviewSearch(ReviewVO r_no);
	
	
	int counselreview(ReviewVO review);
	
	ReviewVO cnoreview(@Param("c_no") int c_no);
	
}
