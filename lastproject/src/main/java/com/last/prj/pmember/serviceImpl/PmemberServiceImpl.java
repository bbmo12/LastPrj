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
import com.last.prj.pmember.service.TimeVO;

@Repository("pMemberDao")
public class PmemberServiceImpl implements PmemberService{
	
	@Autowired PmemberMapper map;
	
	@Override
	public PmemberVO getPmemberinfo(String p_id) {
		return map.getPmemberinfo(p_id);
	}

	@Override
	public List<TimeVO> getTime(String p_id) {
		return map.getTime(p_id);
	}
	
	@Override
	public List<FfileVO> getImage(String p_id) {
		return map.getImage(p_id);
	}

	@Override
	public List<FfileVO> getLicense(String p_id) {
		return map.getLicense(p_id);
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
	public int memberPage(Criteria cri) { 
		return map.memberPage(cri);
	}

	@Override
	public List<PmemberVO> memberPageList(Criteria cri) {
		return map.memberPageList(cri);
	}
	
	@Override
	public int pmemberUpdate(PmemberVO pmember) {
		return map.pmemberUpdate(pmember);
	}
	//운영시간insert
	@Override
	public int pmemberTime(TimeVO time) {
		return map.pmemberTime(time);
	}
	
	@Override
	public int updateLike(String p_id) {		
		return map.updateLike(p_id);
	}
	
	@Override
	public int updateCancel(String p_id) {
		return map.updateCancel(p_id);
	}
	
	@Override
	public List<PmemberVO> bestLike(PmemberVO pmember) {
		return map.bestLike(pmember);
	}
	@Override
	public int deleteTime(TimeVO time) {
		return map.deleteTime(time);
	}
	@Override
	public int deleteTimeId(TimeVO time) {
		return map.deleteTimeId(time);
	}

	@Override
	public List<PmemberVO> admPlistCode(PmemberVO vo) {
		return map.admPlistCode(vo);
	}


	//id로 정보 조회
	@Override
	public PmemberVO PmemberOne(String p_id) {
		// TODO Auto-generated method stub
		return map.PmemberOne(p_id);
	}


	@Override
	public List<ReviewVO> ServiceReviewList() {
		return map.ServiceReviewList();
	}

	@Override
	public List<PmemberVO> bestLikeList() {
		return map.bestLikeList();
	}



	@Override
	public int pmemCount() {
		return map.pmemCount();
	}


	@Override

	public int admPlistCodeCount(PmemberVO vo) {
		return map.admPlistCodeCount(vo);
	}
	
	
	@Override
	public int pmemberNullUpdate(String p_id) {
		return map.pmemberNullUpdate(p_id);
	}


	@Override
	public int pmemberJoinCancel(String p_id) {
		return map.pmemberJoinCancel(p_id);
	}

	@Override
	public int updateTime(TimeVO time) {
		return map.updateTime(time);
	}

	@Override
	public List<PmemberVO> admPlistChart(PmemberVO vo) {
		return map.admPlistChart(vo);
	}

	@Override
	public List<PmemberVO> admgoChart() {
		return map.admgoChart();
	}

	@Override
	public int pMemCode(String p_id) {
		return map.pMemCode(p_id);
	}



	

}
