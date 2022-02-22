package com.last.prj.pmember.service;

import java.util.List;

public interface PmemberService {
	
	
	
	public List<PmemberVO> memberList(int code); //전체리스트
	public PmemberVO memberSelect(PmemberVO pmember); //한건조회
	public PmemberVO getMember(String p_id); //상세정보
	public List<FfileVO> getPicture(String p_id); //사진리스트
	public ReviewVO getCounselReview(String p_id); //리뷰
	
}
	