package com.last.prj.reserv.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.calendar.service.CalendarService;
import com.last.prj.calendar.service.CalendarVO;
import com.last.prj.reserv.service.PreservationCodeListVO;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;


import com.last.prj.reserv.service.PreservationVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationDao;

	@Autowired
	private PreservationlistService pReservationDao;
	
	@Autowired
	private CalendarService CalendarDao;
	
	//일반회원 예약하기
	@RequestMapping("/test")
	public String reservation(Model model) {
		
		List<CalendarVO> list = CalendarDao.revSetList();
		model.addAttribute("reservset",list);
		System.out.println(list);
		return "reservation/test";
	}
	
	//파트너회원 예약설정
	@RequestMapping("/reservationSetting")
	public String reservationSetting(Model model,PreservationVO pres) {
		//List<PreservationVO> list = pReservationDao.preservationlist();
		
		return "reservation/resvSetting";
		
	}
	
	
	// 일반 예약조회
	@RequestMapping("/reservationSelect")
	public String nReservationSelect(Model model, ReservationVO res) {
		System.out.println(reservationDao.reservationSelect());
		List<ReservationVO> list = reservationDao.reservationSelect();
		model.addAttribute("reservation", list);
		System.out.println(list);
		return "reservation/reservation";
	}

	// 파트너 예약조회
	@RequestMapping("/preservationSelect")
	public String pReservationSelect(Model model) {
		System.out.println(pReservationDao.preservationlist());
		List<PreservationVO> list = pReservationDao.preservationlist();

		model.addAttribute("preservation", list);
		System.out.println(list);
		return "reservation/preservation";
	}
	
	  //파트너회원 예약승인 후 절차(ajax)
	  @PostMapping("/okupdate")
	  @ResponseBody 
	  public String okUpdate(@RequestParam("rno") String rno) {
		  System.out.println(rno);
		  reservationDao.okUpdate(Integer.parseInt(rno));
		  return "ok";
	  }
	  
	  //파트너회원 예약거절 사유 입력(ajax)
	  @PostMapping("/noupdate")
	  @ResponseBody 
	  public List<PreservationVO> noUpdate(@RequestParam("rno") String rno,@RequestParam("refuse") String refuse ,Model model) {
		  System.out.println(rno);
		  reservationDao.noUpdate(Integer.parseInt(rno),refuse);
		  List<PreservationVO> list = pReservationDao.preservationlist();
		  System.out.println(list);
		  return list;
	  }
	  
	  //일반회원 결제완료 후 코드변경 (ajax)
	  @PostMapping("/payupdate")
	  @ResponseBody 
	  public String payUpdate(@RequestParam("rno") String rno) {
		  System.out.println(rno);
		  reservationDao.payUpdate(Integer.parseInt(rno));
		  return "ok";
	  }
	  
	  
	 
}
