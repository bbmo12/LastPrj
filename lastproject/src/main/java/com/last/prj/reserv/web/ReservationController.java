package com.last.prj.reserv.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.calendar.service.CalendarService;
import com.last.prj.calendar.service.CalendarVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservCountService;
import com.last.prj.reserv.service.ReservCountVO;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;


import com.last.prj.reserv.service.PreservationVO;

@Controller
public class ReservationController {
	@Autowired
	private MemService memDao;

	@Autowired
	private ReservationService reservationDao;

	@Autowired
	private PreservationlistService pReservationDao;
	
	@Autowired
	private CalendarService CalendarDao;
	
	@Autowired
	private ReservCountService reservCountDao;
	
	@Autowired
	private PetService petDAO;
	
	//일반회원 예약하기
	@RequestMapping("/test")
	public String reservation(Model model,HttpServletRequest request,CalendarVO vo) {
		//로그인 세션값
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		System.out.println("m_id : " +m_id);
		
		vo.setP_id(m_id);
		//달력리스트
		List<CalendarVO> list = CalendarDao.revSetList(vo);
		
		//펫정보조회
		List <PetVO> petList = petDAO.petmemberList(m_id);
		
		model.addAttribute("petList",petList);
		model.addAttribute("reservset",list);
		System.out.println(list);
		System.out.println(petList);
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
	public String pReservationSelect(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		System.out.println("m_id : " +m_id);
		model.addAttribute("member",memDao.memberSearch(m_id));
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
	  
	  //일반회원 결제완료 후 코드변경 
	  @PostMapping("/payupdate")
	  @ResponseBody 
	  public String payUpdate(@RequestParam("rno") String rno) {
		  System.out.println(rno);
		  reservationDao.payUpdate(Integer.parseInt(rno));
		  return "ok";
	  }
	  //예약된 날짜/시간 체크
	  @PostMapping("/reservcount")
	  @ResponseBody
	  public ReservCountVO reservCountSelect(@RequestParam("reserv_date")String reserv_date, @RequestParam("reserv_time")String reserv_time) {
		  System.out.println(reserv_date);
		  System.out.println(reserv_time);
		  System.out.println(reservCountDao.reservCountSelect(reserv_date,reserv_time));
		  return reservCountDao.reservCountSelect(reserv_date,reserv_time);
	  }
	  //예약등록
	  @PostMapping("/reservinsert")
	  @ResponseBody
	  public int reservInsert(@RequestParam("r_date")String r_date,@RequestParam("time")String time,@RequestParam("rcontent")String rcontent,@RequestParam("r_code")String r_code,ReservationVO vo) {
		  vo.setR_code(r_code);
		  vo.setR_date(r_date);
		  vo.setTime(time);
		  vo.setRccontent(rcontent);
		  reservationDao.reservInsert(vo);
		  return 1;
	  }
	  
	  
	  
	 
}
