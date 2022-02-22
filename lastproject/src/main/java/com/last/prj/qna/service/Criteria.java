package com.last.prj.qna.service;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	//페이지 숫자와 글 수를 가지고 있을 클래스
	
	
	public Criteria() {
		this(1,10);
	}
	//값이 넘어오지 않을 경우 1과 10으로 초기화.
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
