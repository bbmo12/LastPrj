package com.last.prj.pay.web;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.PmemService;
import com.last.prj.pay.service.PayService;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.security.CustomUser;

@Controller
public class PayController {

	@Autowired
	private PayService payDao;
	
	@Autowired
	private MemService memDao;
	
	
	@RequestMapping("/myPay")
	public String myPay(Model model, HttpServletRequest request,Principal principal) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				model.addAttribute("pay",payDao.myPayList(m_id));
				model.addAttribute("member",memDao.memberSearch(m_id));
				System.out.println(m_id);
				return "mypage/myPay";
			}
		}
		return null;
	}
	
}
