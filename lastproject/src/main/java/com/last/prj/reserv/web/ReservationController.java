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
import com.last.prj.pay.service.PayService;
import com.last.prj.pay.service.PayVO;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservCountService;
import com.last.prj.reserv.service.ReservCountVO;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;
import com.last.prj.reserv.service.PreservationVO;

@Controller
public class ReservationController {

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
	
	@Autowired
	private ServiceService serviceDao;
	
	@Autowired
	private PmemberService pMemberDao;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	private PayService payDao;
	
	//일반회원 예약페이지
	@RequestMapping("/reservMember")
	public String reservation(Model model,HttpServletRequest request,CalendarVO co,PetVO po,PmemberVO pmo) {
		
		//로그인 세션값
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		System.out.println("m_id : " +m_id);
		String p_id = (String) session.getAttribute("pId");
		System.out.println("p_id : " + p_id);
		  if(m_id==null || m_id =="") {
			  m_id = "test1@a.com"; 
		  } if(p_id == null || p_id== "") {
			  p_id= "kim1@a.com"; 
		  }
		co.setP_id(p_id);
		po.setM_id(m_id);
		pmo.setP_id(p_id);
		
		//달력리스트
		List<CalendarVO> list = CalendarDao.revSetList(co);
		
		//펫정보조회
		List <PetVO> petList = petDAO.petmemberList(m_id);
		
		//펫 품종코드 중복제거값
		List <PetVO> petCode = petDAO.petCodeSearch(m_id);
	
		
		model.addAttribute("petList",petList);
		model.addAttribute("petCode",petCode);
		model.addAttribute("reservset",list);
		model.addAttribute("pmemdetail", pMemberDao.getPmemberinfo(p_id));
		//해당 파트너회원 정보조회
		model.addAttribute("pmember", pMemberDao.PmemberOne(p_id));
		System.out.println(list);
		System.out.println(petList);
		return "reservation/reservMember";
	}
	
	//파트너회원 예약설정
	@RequestMapping("/reservationSetting")
	public String reservationSetting(Model model,PreservationVO pres) {
		return "reservation/resvSetting";
	}
	
	
	// 일반 예약조회
	@RequestMapping("/reservationSelect")
	public String nReservationSelect(Model model, ReservationVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		System.out.println("일반예약 아이디세션값 : " + m_id);
		
		vo.setM_id(m_id);
		List<ReservationVO> list = reservationDao.reservationSelect(vo);
		System.out.println(list);
		model.addAttribute("reservation", list);
		return "reservation/reservation";
	}

	// 파트너 예약조회
	@RequestMapping("/preservationSelect")
	public String pReservationSelect(Model model,HttpServletRequest request,PreservationVO vo) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		vo.setP_id(p_id);
		List<PreservationVO> list = pReservationDao.preservationlist(vo);
		model.addAttribute("preservation", list);
		System.out.println(list);
		
		return "reservation/preservation";
	}
	
	  //파트너회원 예약승인 후 절차(ajax)
	  @PostMapping("/okupdate")
	  @ResponseBody 
	  public String okUpdate(@RequestParam("rno") int rno) {
		  System.out.println(rno);
		  reservationDao.okUpdate(rno);
		  return "ok";
	  }
	  
	  //파트너회원 예약거절 사유 입력(ajax)
	  @PostMapping("/noupdate")
	  @ResponseBody 
	  public List<PreservationVO> noUpdate(@RequestParam("rno") int rno,@RequestParam("refuse") String refuse ,Model model,PreservationVO vo,HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  String p_id = (String) session.getAttribute("pId");
		  vo.setP_id(p_id);
		  System.out.println(rno);
		  reservationDao.noUpdate(rno,refuse);
		  List<PreservationVO> list = pReservationDao.preservationlist(vo);
		  System.out.println(list);
		  return list;
	  }
	  
	  //일반회원 결제완료 후 코드변경 + 결제내역 등록
	  @PostMapping("/payupdate")
	  @ResponseBody 
	  public String payUpdate(@RequestParam("r_no") int r_no,@RequestParam("m_id")String m_id, PayVO po) {
		  System.out.println(r_no);
		  reservationDao.payUpdate(r_no);
		  
		  //결제내역 등록
		  payDao.payInsert(po);
		  return "ok";
	  }
	  //예약된 날짜/시간 체크
	  @PostMapping("/reservcount")
	  @ResponseBody
	  public ReservCountVO reservCountSelect(ReservCountVO vo) {
		  return reservCountDao.reservCountSelect(vo);
	  }
	  //예약등록
	  @PostMapping("/reservinsert")
	  @ResponseBody
	  public int reservInsert(ReservationVO vo,ReservCountVO co,ServiceVO so,PmemberVO po) {
		  
		  int price = 5000;
		  String content;
		  String enddate = "임시";
		  reservationDao.reservInsert(vo);
		  
		  //예약날짜 , 시간값
		  co.setReserv_date(vo.getR_date());
		  co.setReserv_time(vo.getTime());
		  System.out.println("코드출력 : " + so.getCode());
		  if(so.getCode()==100) {
			  content="진료";
		  }else if(so.getCode()==101){
			  content="훈련";
		  }else if(so.getCode()==102) {
			  content ="미용";
		  }else {
			  content="펫시팅";
		  }
			  
		  so.setR_no(vo.getR_no());
		  so.setStartdate(vo.getR_date());
		  so.setP_id(vo.getP_id());
		  so.setContent(content);
		  so.setPrice(price);
		  so.setEnddate(enddate);
		  serviceDao.ServiceInsert(so);
		  reservCountDao.reservCountInsert(co);
		  return 1;
	  }
	  
	  
	  @RequestMapping("reviewWrithForm")
	  @ResponseBody
	  public ReservationVO reviewWrithForm(int r_no) {
		  return reservationDao.reviewWrithForm(r_no);
	  }
	 
}
