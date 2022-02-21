package com.last.prj.pmember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;

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
	public PmemberVO getMember(String name) {
		return map.getMember(name);
	}

}
