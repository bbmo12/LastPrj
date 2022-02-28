package com.last.prj.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.prj.review.service.ReviewService;

@Controller
public class ReviewController {
	

	@Autowired
	private ReviewService reviewDao;
	
}
