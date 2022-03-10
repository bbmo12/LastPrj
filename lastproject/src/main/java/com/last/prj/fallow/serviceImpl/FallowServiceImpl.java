package com.last.prj.fallow.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.fallow.service.FollowMapper;
import com.last.prj.fallow.service.FollowService;
import com.last.prj.fallow.service.FollowVO;

@Repository("followDao")
public class FallowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper map;

	@Override
	public List<FollowVO> myFollowSearch(String m_id) {
		return map.myFollowSearch(m_id);
	}

	@Override
	public int followInsert(FollowVO follow) {
		return map.followInsert(follow);
	}

	@Override
	public int followDelete(FollowVO follow) {
		return map.followDelete(follow);
	}

	@Override
	public int followCheck(FollowVO follow) {
		return map.followCheck(follow);
	}
	

}
