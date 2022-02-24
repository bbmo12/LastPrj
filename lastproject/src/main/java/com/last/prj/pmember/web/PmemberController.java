package com.last.prj.pmember.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.pmember.service.FfileVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;

@Controller
public class PmemberController {
	
	@Autowired
	private PmemberService pMemberDao;
	
	@RequestMapping("/pmemberList")
	public String pmemberList(@RequestParam("code") int code, Model model) {
		model.addAttribute("pmember", pMemberDao.memberList(code));
		System.out.println(code);
		return "pmember/memberList";
	}

	
	@ResponseBody
	@PostMapping("/pmemberLocal")
	public List<PmemberVO> pmemberLocal(@RequestParam("coded") int code, @RequestParam("local")String w_address, PmemberVO pmember) {
	    pmember.setCode(code);
	    pmember.setW_address(w_address);
	    pMemberDao.memberSelect(w_address, code);
		System.out.println("지역"+code);
		return pMemberDao.memberList(code);
	}
	@RequestMapping("/pmemberDetail")
	public String pmemberDetail(@RequestParam("id") String p_id, Model model) {		
		//파트너 정보
		model.addAttribute("pmemdetail", pMemberDao.getMember(p_id));	
		model.addAttribute("picture", pMemberDao.getPicture(p_id));
		//후기
		model.addAttribute("counsel", pMemberDao.getCounselReview(p_id));
		model.addAttribute("service", pMemberDao.getServiceReview(p_id));

		return "pmember/memberDetail";
	}
	@ResponseBody
	@PostMapping("/counProfile")
	public List<FfileVO> counProfile(@RequestParam("coun")String m_id) {
		System.out.println("상담"+pMemberDao.getProfile(m_id));
		return pMemberDao.getProfile(m_id);
	}
	@ResponseBody
	@PostMapping("/serviceProfile")
	public List<FfileVO> servicefile(@RequestParam("mid")String m_id) {
		System.out.println("서비스사진"+pMemberDao.getProfile(m_id));
		return pMemberDao.getProfile(m_id);
	}

}
