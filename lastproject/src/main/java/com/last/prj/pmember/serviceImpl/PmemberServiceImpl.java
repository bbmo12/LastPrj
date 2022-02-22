package com.last.prj.pmember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public PmemberVO memberSelect(PmemberVO pmember) {
		return map.memberSelect(pmember);
	}

	@Override
	public PmemberVO getMember(String p_id) {
		return map.getMember(p_id);
	}

	@Override
	public List<FfileVO> getPicture(String p_id) {
		return map.getPicture(p_id);
	}

	@Override
	public ReviewVO getCounselReview(String p_id) {	
		return map.getCounselReview(p_id);
	}


}
