package com.last.prj.fallow.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface FollowService {
	
	public List<FollowVO> myFollowSearch(Criteria cri);//팔로우조회
	public int FollowPage(Criteria cri);
	public int followInsert(FollowVO follow);
	public int followDelete(FollowVO follow);
	public int followCheck(FollowVO follow);//팔로우 체크 중복체크 
}
