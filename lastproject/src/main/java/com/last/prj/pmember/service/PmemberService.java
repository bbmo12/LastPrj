package com.last.prj.pmember.service;

import java.util.List;

public interface PmemberService {

	public PmemberVO getMember(String p_id); //상세정보
	public List<ReviewVO> getCounselReview(String p_id); //상담리뷰
	public List<ReviewVO> getServiceReview(String p_id); //서비스리뷰
	public List<FfileVO> getProfile(String m_id);//회원프로필사진
	public int memberPage(Criteria cri);//페이징 총 회원수
	public List<PmemberVO> memberPageList(Criteria cri);//페이징 리스트
	public int pmemberUpdate(PmemberVO pmember);//파트너회원 정보수정  
    public int pmemberTime(TimeVO time); //otime 수정
    public int deleteTime(TimeVO time); //otime 삭제
    public int updateLike(String p_id); //파트너회원 추천
    public List<PmemberVO> bestLike(PmemberVO pmember);//베스트순위
	
	//관리자
	public List<PmemberVO> admPlistCode(int code);
	public List<PmemberVO> admPlist();
	public List<PmemberVO> admPstartDateList();
	
	//id로 정보 조회
	public PmemberVO PmemberOne(String p_id);
}
