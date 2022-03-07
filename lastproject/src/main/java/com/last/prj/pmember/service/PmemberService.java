package com.last.prj.pmember.service;

import java.util.List;

public interface PmemberService {

	public PmemberVO getPmemberinfo(String p_id);//pmember 정보
	public List<TimeVO> getTime(String p_id);//상세정보 시간표따로 가져옴 
	public List<FfileVO> getImage(String p_id); //첨부파일 
	public List<FfileVO> getLicense(String p_id);
	public List<ReviewVO> getCounselReview(String p_id); //상담리뷰
	public List<ReviewVO> getServiceReview(String p_id); //서비스리뷰
	public int memberPage(Criteria cri);//페이징 총 회원수
	public List<PmemberVO> memberPageList(Criteria cri);//페이징 리스트
	public int pmemberUpdate(PmemberVO pmember);//파트너회원 정보수정  
    public int pmemberTime(TimeVO time); //otime 수정
    public int deleteTime(String p_id); //otime 삭제
    public int updateLike(String p_id); //파트너회원 추천
    public List<PmemberVO> bestLike(PmemberVO pmember);//베스트순위
    public List<ReviewVO> ServiceReviewList(); // 홈화면 리뷰
    public List<PmemberVO> bestLikeList(); // 홈화면 베스트
	
	//관리자
	public List<PmemberVO> admPlistCode(int code);
	public List<PmemberVO> admPlist();
	public List<PmemberVO> admPstartDateList();
	
	//id로 정보 조회
	public PmemberVO PmemberOne(String p_id);
}
