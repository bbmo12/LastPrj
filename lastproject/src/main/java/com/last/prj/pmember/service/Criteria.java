package com.last.prj.pmember.service;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	/* 현재 페이지 */
	private int pageNum;	
	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;
	private int pageBlock;//페이지 버튼 수 
	
	/* 검색 키워드 */
	private String searchType;
	private String keyword;	
	private int code;
	private String param;
	private String w_address;	
	
	public Criteria() {
		this(1, 12);
	    this.keyword = null;
	    this.searchType = null;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", this.pageNum)
				.queryParam("perPageNum", this.amount);
				
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}

}
