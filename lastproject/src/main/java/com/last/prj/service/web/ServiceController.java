package com.last.prj.service.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.diagnosis.service.DiagnosisVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;

@Controller
public class ServiceController {

	@Autowired
	private ServiceService serviceDao;
	@Autowired
	private MemService memDao;
	@Autowired
	private PmemberService pMemberDao;
	
	
	@RequestMapping("/protocol")
	public String protocol(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("member", memDao.memberSearch(m_id));
		model.addAttribute("service", serviceDao.myPetServiceList(m_id));
		
		System.out.println("프로토콜");
		System.out.println(serviceDao.myPetServiceList(m_id));
		
		
		return "mypage/petprotocol";
	}
	
	//파트너회원 내 수익조회
	@RequestMapping("pMembenefit")
	public String pMembenefit(Model model,HttpServletRequest request,ServiceVO vo) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		System.out.println("pMemDiaList============= p_id : " +p_id);
		
		List<ServiceVO> list = serviceDao.pMembenefit(p_id);
		model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));		
		model.addAttribute("pMembenefit",list);
		model.addAttribute("totalPrice",serviceDao.totalPrice(p_id));
		return "mypage/Mybenefit";
	}
	
}
