package com.last.prj.qna.service;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; //페이지 번호
	private int amount; //1페이지당 개수
	
	//검색
	private String searchType;
	private String searchValue;
	
	public Criteria() {
		this(1, 10);
	}
	//값이 넘어오지 않을 경우 1과 10으로 초기화.
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
