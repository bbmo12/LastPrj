package com.last.prj.service.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;

@Controller
public class ServiceController {

	@Autowired
	private ServiceService serviceDao;
	@Autowired
	private MemService memDao;
	
	
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
		model.addAttribute("pMembenefit",vo);
		return "mypage/Mybenefit";
	}
	
}
