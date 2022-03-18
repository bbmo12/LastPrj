package com.last.prj.likehit.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.likehit.service.LikehitService;
import com.last.prj.likehit.service.LikehitVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.security.CustomUser;

@Controller
public class LikehitController {

	@Autowired 
	private LikehitService likehitDao;
	@Autowired
	private PmemberService pMemberDao;
	
	@RequestMapping("pmemberLike")//추천수
	@ResponseBody
	public int pmemberLike(@RequestParam("p_id")String p_id, LikehitVO hit, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				m_id  =userDetails.getMember().getM_id();
			}
		}
		hit.setM_id(m_id);
		int likeCheck = likehitDao.likeCheck(hit);
		if(likeCheck == 0) {
			pMemberDao.updateLike(p_id);
			likehitDao.insertLike(hit);//팔로우
		} else if(likeCheck == 1) {
			pMemberDao.updateCancel(p_id);
			likehitDao.deleteLike(hit);//언팔
		}
		return likeCheck;
	}

}
