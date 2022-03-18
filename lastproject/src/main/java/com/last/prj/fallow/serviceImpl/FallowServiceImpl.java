package com.last.prj.fallow.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.fallow.service.FollowMapper;
import com.last.prj.fallow.service.FollowService;
import com.last.prj.fallow.service.FollowVO;
import com.last.prj.pmember.service.Criteria;

@Repository("followDao")
public class FallowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper map;

	@Override
	public List<FollowVO> myFollowSearch(Criteria cri) {
		return map.myFollowSearch(cri);
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

	@Override
	public int FollowPage(Criteria cri) {
		return map.FollowPage(cri);
	}
	

}
