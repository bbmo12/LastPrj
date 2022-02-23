package com.last.prj.pmember.service;

import java.util.List;

public interface PmemberMapper {

	public List<PmemberVO> memberList(int code); //전체리스트
	public PmemberVO memberSelect(PmemberVO pmember); //한건조회
	public PmemberVO getMember(String p_id); //상세정보
	public List<FfileVO> getPicture(String p_id); //사진리스트
	public List<ReviewVO> getCounselReview(String p_id); //상담리뷰
	public List<ReviewVO> getServiceReview(String p_id); //서비스리뷰
	public List<FfileVO> getProfile(String m_id);//회원프로필사진
}
