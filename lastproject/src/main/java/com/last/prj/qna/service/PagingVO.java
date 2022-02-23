package com.last.prj.qna.service;

import lombok.Data;

@Data
public class PagingVO {
	
//	@Getter
//	@Setter
//	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, sql 쿼리에 쓸 start, end
//	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start_no, end_no;
//	public int getCntPage() {
//		return cntPage;
//	}
//
//	public void setCntPage(int cntPage) {
//		this.cntPage = cntPage;
//	}
//
//
//	private int cntPage = 5; // 한 페이지당 보여질 페이지 개수
//
//	public PagingVO() {
//	}
//
//	public PagingVO(int total, int nowPage, int cntPerPage) {
//		setNowPage(nowPage);
//		setCntPerPage(cntPerPage);
//		setTotal(total);
//		calcLastPage(getTotal(), getCntPerPage());
//		calcStartEndPage(getNowPage(), cntPage);
//		calcStartEnd(getNowPage(), getCntPerPage());
//	}
//
//	
//	public void calcLastPage(int total, int cntPerPage) {
//		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
//	}
//
//	
//	public void calcStartEndPage(int nowPage, int cntPage) {
//		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
//		if (getLastPage() < getEndPage()) {
//			setEndPage(getLastPage());
//		}
//		setStartPage(getEndPage() - cntPage + 1);
//		if (getStartPage() < 1) {
//			setStartPage(1);
//		}
//	}
//
//	
//	public void calcStartEnd(int nowPage, int cntPerPage) {
//		
//		setEnd_no(nowPage * cntPerPage);
//		setStart_no(getEnd_no() - cntPerPage + 1);
//	}


	private int startPage; // 첫페이지 번호
	private int endPage; // 마지막페이지
	private boolean next; // 다음 버튼 활성화
	private boolean prev; // 이전 버튼 활성화

	private int total; // 총 게시글 수
	private int pageNum; // 조회하는 페이지 번호
	private int amount;
	
	private Criteria cri;


	public PagingVO(Criteria cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		
		this.total = total; //전체 게시글 수
		this.cri = cri; //요청 정보
		
		this.endPage = (int) Math.ceil(this.pageNum / 10.0) * 10;
		this.startPage = this.endPage - 10 + 1;
		
		int realEnd = (int) Math.ceil(this.total / (double) this.amount);
		
		if (this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;

	}
	
	
}
