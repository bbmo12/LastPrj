package com.last.prj.pay.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.PmemService;
import com.last.prj.pay.service.PayService;
import com.last.prj.pmember.service.PmemberService;

@Controller
public class PayController {

	@Autowired
	private PayService payDao;
	
	@Autowired
	private MemService memDao;
	
	
	@RequestMapping("/myPay")
	public String myPay(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		model.addAttribute("pay",payDao.myPayList(m_id));
		model.addAttribute("member",memDao.memberSearch(m_id));
		System.out.println(m_id);
		return "mypage/myPay";
	}
	
}
