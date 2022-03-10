package com.last.prj.fallow.service;

import java.util.List;

public interface FollowService {
	
	public List<FollowVO> myFollowSearch(String m_id);
	public int followInsert(FollowVO follow);
	public int followDelete(FollowVO follow);
	public int followCheck(FollowVO follow);//팔로우 체크 중복체크 
}
