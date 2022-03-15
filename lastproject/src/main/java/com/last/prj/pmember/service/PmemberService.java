package com.last.prj.pmember.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
    public int pmemberTime(TimeVO time); //otime insert
    public int deleteTime(TimeVO time); //otime o_no조건 삭제
    public int deleteTimeId(TimeVO time);//pid조건 삭제
    public int updateTime(TimeVO time);
    public int updateLike(String p_id); //파트너회원 추천
    public int updateCancel(String p_id); //추천취소 
    public List<PmemberVO> bestLike(PmemberVO pmember);//베스트순위
    public List<ReviewVO> ServiceReviewList(); // 홈화면 리뷰
    public List<PmemberVO> bestLikeList(); // 홈화면 베스트

    public int pmemberNullUpdate(String p_id); //파트너회원 탈퇴시 모든정보 null

    public int pmemberJoinCancel(String p_id); //파트너회원폼2~3 입력중 취소시 데이터삭제
	

	//관리자
 	public List<PmemberVO> admPlistCode(PmemberVO vo); //파트너쉽 별 리스트
	public int pmemCount(); //파트너 회원 수
	
	//id로 정보 조회
	public PmemberVO PmemberOne(String p_id);
	public int admPlistCodeCount(PmemberVO vo);
	public List<PmemberVO> admPlistChart(PmemberVO vo);
	public List<PmemberVO> admgoChart();
	

}
