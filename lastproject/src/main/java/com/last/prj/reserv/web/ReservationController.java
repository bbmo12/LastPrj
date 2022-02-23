package com.last.prj.reserv.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.reserv.service.preservationlistVO;


@Controller
public class ReservationController {

	
	@Autowired
	private ReservationService reservationDao;
	
	@Autowired
	private PreservationlistService PreservationlistDao;
	/*
	  @Autowired private FullcalendarService fullcalendarDao;
	 */
	
	//예약 전체조회
	@RequestMapping("/reservationSelectList")
	public String reservationSelectList(Model model,HttpSession session) {
		
		List<ReservationVO> list = reservationDao.reservationSelectList();
		model.addAttribute("reservation", list);
		System.out.println(list);
		return "reservation/reservation";
	}
	
	//일반 예약조회
	@RequestMapping("/reservationSelect")
	public String nReservationSelect(Model model,ReservationVO res) {
		System.out.println(reservationDao.reservationSelect());
		List<ReservationVO> list = reservationDao.reservationSelect();
		model.addAttribute("reservation",list);
		System.out.println(list);
		return "reservation/reservation";
	}
	
	//파트너 예약조회
		@RequestMapping("/preservationSelect")
		public String pReservationSelect(Model model) {
			System.out.println(PreservationlistDao.preservationlist());
			List<preservationlistVO> list = PreservationlistDao.preservationlist();
			
			
			model.addAttribute("preservation",list);
			System.out.println(list);
			return "reservation/preservation";
		}
}
