package com.last.prj.pmember.service;

import lombok.Data;

@Data
public class PagingVO {
	private int startPage; // 첫페이지 번호
	private int endPage; // 마지막페이지
	private boolean next=true; // 다음 버튼 활성화
	private boolean prev; // 이전 버튼 활성화
	private int pageBlock=5;//페이지 버튼 수 
	
	private int total; // 총 게시글 수
	private int pageNum; // 조회하는 페이지 번호
	private int amount = 12;
	private Criteria cri;


	public PagingVO(Criteria cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		
		this.total = total; //전체 게시글 수
		this.cri = cri; //요청 정보

		
		this.endPage = (int) Math.ceil(this.pageNum / (double)this.pageBlock) * this.pageBlock;
		this.startPage = this.endPage - this.pageBlock + 1;
		//마지막페이지ㅜ
		int realEnd = (int) Math.ceil(this.total / (double) this.amount);
		
		if (this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;

	}

}
