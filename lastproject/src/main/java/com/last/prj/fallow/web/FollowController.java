package com.last.prj.fallow.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.fallow.service.FollowMapper;
import com.last.prj.fallow.service.FollowService;
import com.last.prj.fallow.service.FollowVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.security.CustomUser;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followDao;
	@Autowired
	private MemService memDao;
	@Autowired
	private FollowMapper mapper;
	
	@RequestMapping("/myfallow")
	public String myfallow(Model model, Principal principal, Criteria cri, FollowVO follow) {
		cri.setAmount(12);
		String m_id = "0";
		
		
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				m_id = userDetails.getMember().getM_id();
				cri.setM_id(m_id);
				PagingVO paging = new PagingVO(cri, mapper.FollowPage(cri));
				model.addAttribute("follow",followDao.myFollowSearch(cri));
				model.addAttribute("member",memDao.memberOne(m_id));
				model.addAttribute("page", paging);
				return "member/myfallow";
			}
		}
		return "member/myfallow";
	}
	@RequestMapping("insertFollow")
	@ResponseBody
	public int insertFollow(FollowVO follow, Principal principal, Model model) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}	
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
