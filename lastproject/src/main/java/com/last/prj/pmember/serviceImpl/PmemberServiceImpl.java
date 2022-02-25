package com.last.prj.pmember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.FfileVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewVO;

@Repository("pMemberDao")
public class PmemberServiceImpl implements PmemberService{
	
	@Autowired PmemberMapper map;

	@Override
	public List<PmemberVO> memberList(int code) {
		return map.memberList(code);
	}

	@Override
	public List<PmemberVO> memberSelect(String w_address, int code) {
		return map.memberSelect(w_address, code);
	}

	@Override
	public PmemberVO getMember(String p_id) {
		return map.getMember(p_id);
	}
	
	@Override
	public List<ReviewVO> getCounselReview(String p_id) {
		return map.getCounselReview(p_id);
	}

	@Override
	public List<ReviewVO> getServiceReview(String p_id) {
		return map.getServiceReview(p_id);
	}


	@Override
	public List<FfileVO> getProfile(String m_id) {
		return map.getProfile(m_id);
	}
	
	//관리자
	@Override
	public List<PmemberVO> admPlistCode(int code) {
		return map.admPlistCode(code);
	}
	//관리자
	@Override
	public List<PmemberVO> admPlist() {
		return map.admPlist();
	}

}
