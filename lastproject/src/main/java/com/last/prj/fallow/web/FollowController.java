package com.last.prj.fallow.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.fallow.service.FollowService;
import com.last.prj.fallow.service.FollowVO;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followDao;
	
	@RequestMapping("/myfallow")
	public String myfallow(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("follow",followDao.myFollowSearch(m_id));
		return "member/myfallow";
	}
	@RequestMapping("insertFollow")
	@ResponseBody
	public int insertFollow(FollowVO follow, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		follow.setM_id(m_id);
		
		int followCheck = followDao.followCheck(follow);
		if(followCheck == 0) {
			followDao.followInsert(follow);//팔로우 
		}else if (followCheck == 1) {
			followDao.followDelete(follow);//언팔  
		}
		return followCheck;
	}
}
