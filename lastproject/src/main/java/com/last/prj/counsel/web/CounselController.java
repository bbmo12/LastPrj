package com.last.prj.counsel.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.counsel.service.CounselMapper;
import com.last.prj.counsel.service.CounselService;
import com.last.prj.mem.service.MemService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;

@Controller
public class CounselController {

	
	@Autowired
	private CounselService counselDao;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	private PmemberService pMemberDao;
	
	@Autowired
	private CounselMapper mapper;
	
	@RequestMapping("/mycounsel")
	public String mycounsel(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("member",memDao.memberSearch(m_id));
		model.addAttribute("mycounsel" ,counselDao.myCounselList(m_id));
		
		return "mypage/mcounselSearch";
	}
	//파트너회원 상담내역
	@RequestMapping("/pmemcounsel")
	public String pmemcounsel(Model model, HttpServletRequest request, Criteria cri) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		cri.setP_id(p_id);
		cri.setAmount(10);
		PagingVO paging = new PagingVO(cri, mapper.counselPage(cri));
		model.addAttribute("page", paging);
		model.addAttribute("pmemcounsel", mapper.counselList(cri));//페이징
		model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); //pmember 상세정보
		return "mypage/pmemcounsel";
	}
}
