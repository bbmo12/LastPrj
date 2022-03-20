package com.last.prj;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.mem.service.MemService;
import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.qna.service.QnaService;
import com.last.prj.security.CustomUser;

@Controller
public class HomeController {
	
	@Autowired
	public NoticeService noticeDao;
	
	@Autowired
	public PmemberService pMemberDao;
	
	@Autowired
	public QnaService qnaDAO;
	
	@Autowired
	public PetService petDAO;
	
	@Autowired
	public MemService memDao;
	

	@RequestMapping("/home")
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("bestList", pMemberDao.bestLikeList());
		model.addAttribute("serviceReviewList", pMemberDao.ServiceReviewRecent());
		model.addAttribute("qnaRecent", qnaDAO.qnaRecent());
		
		return "home/home";
	}
	
	@RequestMapping("/noticeList")
	@ResponseBody
	public List<NoticeVO> noticeList(Model model, HttpServletRequest request,  Principal principal) {
		String id = "";
		if(principal != null) {
			
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(userDetails.getRole() == "일반회원") {
			//System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
			//System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
			id = userDetails.getMember().getM_id();
			
			
		}else if(userDetails.getRole() == "파트너회원") {
			//System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
			//System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			id = userDetails.getPmember().getP_id();
		}

		}
		model.addAttribute("noticeList", noticeDao.noticeSelectList(id));
		
		return noticeDao.noticeSelectList(id);
	}
	
	@RequestMapping("/getId")
	@ResponseBody
	public String getSessionId(Model model, Principal principal) {
		System.out.println(principal);
		
		// 세션 가져오기
		// 로그인 전에도 실행되는 부분이라 null체크
		String id = "";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				//System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				//System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				id = userDetails.getMember().getM_id();
				
				
			}else if(userDetails.getRole() == "파트너회원") {
				//System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				//System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
				id = userDetails.getPmember().getP_id();
			}
		}
		
		return id;
		/*
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mId");
		String pid = (String) session.getAttribute("pId");
		
		if(mid != null) {
			return mid;
		}else {
			return pid;
		}
		*/
	}
	
	@RequestMapping("/mainMypage")
	public String mypage(Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id  =userDetails.getMember().getM_id();
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
		}
		
		int cnt = memDao.countReview1(m_id) + memDao.countReview2(m_id);
		
		model.addAttribute("pets", petDAO.petmemberList(m_id));
		model.addAttribute("member", memDao.memberSearch(m_id));
		model.addAttribute("notices", noticeDao.noticeSelectList2(m_id));
		
		model.addAttribute("cntC", memDao.countCounsel(m_id));
		model.addAttribute("cntW", cnt);
		model.addAttribute("cntR", memDao.countReservation(m_id));
		
		
		return "mypage/mainMypage";
	}
	
}