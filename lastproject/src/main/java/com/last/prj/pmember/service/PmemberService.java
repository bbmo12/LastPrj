package com.last.prj.pmember.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PmemberService {

	public List<PmemberVO> memberList(int code); // 전체리스트

	public List<PmemberVO> memberSelect(@Param("param") String w_address, @Param("code") int code); // 한건조회

	public PmemberVO getMember(String p_id); // 상세정보

	public List<ReviewVO> getCounselReview(String p_id); // 상담리뷰

	public List<ReviewVO> getServiceReview(String p_id); // 서비스리뷰

	public List<FfileVO> getProfile(String m_id);// 회원프로필사진

	// 관리자
	public List<PmemberVO> admPlistCode(int code);

	public List<PmemberVO> admPlist();

	// id로 정보 조회
	public PmemberVO PmemberOne(String p_id);

}
