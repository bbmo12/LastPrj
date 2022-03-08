package com.last.prj.fallow.service;

import java.util.List;

public interface FollowMapper {

	public List<FollowVO> myFollowSearch(String m_id);//팔로우조회
	public int followInsert(FollowVO follow);//팔로우 추가
	public int followDelete(FollowVO follow);//언팔
}
