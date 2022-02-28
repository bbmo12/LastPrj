package com.last.prj.pmember.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;

@Controller
public class PmemberController {
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private PmemberMapper mapper;
	
	@RequestMapping("/pmemberList")
	public String pmemberList(@RequestParam("code") int code, Model model,Criteria cri) {		
//		String json = new Gson().toJson(pMemberDao.memberList(code));
//		model.addAttribute("babo", json);
		PagingVO paging = new PagingVO(cri, mapper.memberPage(cri));
		model.addAttribute("page", paging);//페이징 수 
		model.addAttribute("pageList", mapper.memberPageList(cri));//페이징 리스트 
		return "pmember/memberList";
	}
	//지역검색  
	@ResponseBody
	@PostMapping("/pmemberLocal")
	public List<PmemberVO> pmemberLocal(Criteria cri, Model model, PmemberVO pmember) {
		return pMemberDao.memberPageList(cri);
	}
	//상세페이지 
	@RequestMapping("/pmemberDetail")
	public String pmemberDetail(@RequestParam("id") String p_id, Model model) {		
		//파트너 정보
		model.addAttribute("pmemdetail", pMemberDao.getMember(p_id));	
		//후기
		model.addAttribute("counsel", pMemberDao.getCounselReview(p_id));
		model.addAttribute("service", pMemberDao.getServiceReview(p_id));
		return "pmember/memberDetail";
	}
	@RequestMapping("/memberMain")
	public String home() {
		return "pmember/memberMain";
	}
	@RequestMapping("/pmemberMyPage")
	public String mypage() {
		return "pmember/pmemberMypage";
	}
	
}
