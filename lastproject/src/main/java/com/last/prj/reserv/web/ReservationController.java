package com.last.prj.reserv.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;

@Controller
public class ReservationController {

	
	@Autowired
	private ReservationService reservationDao;
	
	@RequestMapping("/reservationSelectList")
	public String reservationSelectList(Model model) {
		List<ReservationVO> list = reservationDao.reservationSelectList();
		model.addAttribute("reservation", list);
		System.out.println(list);
		return "reservation/reservation";
	}
	@RequestMapping("/reservationSelect")
	public String reservationSelect(Model model) {
		
		model.addAttribute("reservation", reservationDao.reservationSelect(null));
		return "reservation/reservation";
	}
}
