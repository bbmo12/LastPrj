package com.last.prj.pmember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.ReviewVO;
import com.last.prj.pmember.service.TimeVO;

@Repository("pMemberDao")
public class PmemberServiceImpl implements PmemberService{
	
	@Autowired PmemberMapper map;

	@Override
	public PmemberVO getMember(String p_id) {
		return map.getMember(p_id);
	}
	
	@Override
	public PmemberVO getPmemberinfo(String p_id) {
		return map.getPmemberinfo(p_id);
	}

	@Override
	public List<TimeVO> getTime(String p_id) {
		return map.getTime(p_id);
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
	public List<PmemberVO> bestLike(PmemberVO pmember) {
		return map.bestLike(pmember);
	}
	@Override
	public int deleteTime(String p_id) {
		return map.deleteTime(p_id);
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


	//id로 정보 조회
	@Override
	public PmemberVO PmemberOne(String p_id) {
		// TODO Auto-generated method stub
		return map.PmemberOne(p_id);
	}

	@Override
	public List<PmemberVO> admPstartDateList() {
		return map.admPstartDateList();
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
	public List<PmemberVO> admPmemberPageList(Criteria cri) {
		return  map.admPmemberPageList(cri);
	}

	@Override
	public int pmemCount() {
		return map.pmemCount();
	}

	@Override
	public List<PmemberVO> admPmemberDate(String fromDate, String toDate) {
		return map.admPmemberDate(fromDate, toDate);
	}

}
