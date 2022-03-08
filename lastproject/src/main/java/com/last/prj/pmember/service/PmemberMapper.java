package com.last.prj.pmember.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PmemberMapper {

	public PmemberVO getPmemberinfo(String p_id);
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
	public List<PmemberVO> bestLikeList();
	
	

	
	//관리자
	public List<PmemberVO> admPlistCode(int code); //파트너쉽 별 리스트
	public List<PmemberVO> admPlist(); 
	public List<PmemberVO> admPstartDateList(); //개월 수
	public List<PmemberVO> admPmemberPageList(Criteria cri); //파트너 회원 페이징
	public int pmemCount(); //파트너 회원 수
	public List<PmemberVO> admPmemberDate(@Param("fromDate")String fromDate, @Param("toDate")String toDate); //날짜 별 회원 조회
	
	//id로 정보 조회
	public PmemberVO PmemberOne(String p_id);
	

}


