package com.last.prj.likehit.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.likehit.service.LikehitService;
import com.last.prj.likehit.service.LikehitVO;
import com.last.prj.pmember.service.PmemberService;

@Controller
public class LikehitController {

	@Autowired 
	private LikehitService likehitDao;
	@Autowired
	private PmemberService pMemberDao;
	
	@RequestMapping("pmemberLike")//추천수
	@ResponseBody
	public int pmemberLike(@RequestParam("p_id")String p_id, LikehitVO hit, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		hit.setM_id(m_id);
		
		int likeCheck = likehitDao.likeCheck(hit);
		if(likeCheck == 0) {
			pMemberDao.updateLike(p_id);
			likehitDao.insertLike(hit);
		} else if(likeCheck == 1) {
			pMemberDao.updateCancel(p_id);
			likehitDao.deleteLike(hit);
		}
		return likeCheck;
	}

}
