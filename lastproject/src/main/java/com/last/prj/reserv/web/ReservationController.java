package com.last.prj.reserv.web;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservCountService;
import com.last.prj.reserv.service.ReservCountVO;
import com.last.prj.reserv.service.ReservationMapper;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.security.CustomUser;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;
import com.last.prj.reserv.service.PreservationVO;
import com.last.prj.reserv.service.PreservationlistMapper;

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
	private ReservationMapper mapper;
	
	@Autowired
	private PreservationlistMapper pmapper;
	
	@Autowired
	private PayService payDao;
	
	
	
	//일반회원 예약페이지
	@RequestMapping("/reservMember")
	public String reservation(@RequestParam("p_id")String p_id, Model model,HttpServletRequest request,CalendarVO co,PetVO po,PmemberVO pmo,HttpServletResponse response, Principal principal) throws Exception {
		
			if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "일반회원") {
					String m_id = userDetails.getMember().getM_id();
					System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
					System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
					co.setP_id(p_id);
					po.setM_id(m_id);
					pmo.setP_id(p_id);
					
					//달력리스트
					List<CalendarVO> list = CalendarDao.revSetList(co);
					
					//펫정보조회
					List <PetVO> petList = petDAO.petmemberList(userDetails.getMember().getM_id());
					
					//펫 품종코드 중복제거값
					List <PetVO> petCode = petDAO.petCodeSearch(userDetails.getMember().getM_id());
				
					
					model.addAttribute("petList",petList);
					model.addAttribute("petCode",petCode);
					model.addAttribute("reservset",list);
					//해당 파트너회원 정보조회
					model.addAttribute("pmember", pMemberDao.PmemberOne(p_id));
					System.out.println(list);
					System.out.println(petList);
					return "reservation/reservMember";
					
				}
		}
			//비회원 로그인창으로 이동
			response.setContentType("text/html; charset=utf-8"); PrintWriter out =
			response.getWriter();
			out.println("<script>alert('로그인이 필요한 서비스입니다.'); </script>"); out.flush();
			return "member/loginForm"; 
	}
		
	//파트너회원 예약설정
	@RequestMapping("/reservationSetting")
	public String reservationSetting(Model model,PreservationVO pres,HttpServletRequest request,Principal principal) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
				model.addAttribute("p_id",userDetails.getPmember().getP_id());
				return "reservation/resvSetting";
			}
		}
		
		return "reservation/resvSetting";
	}
	
	
	// 일반 예약조회
	@RequestMapping("/reservationSelect")
	public String nReservationSelect(Model model, ReservationVO vo,HttpServletRequest request,Criteria cri,Principal principal) {
		
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				cri.setM_id(m_id);
				cri.setAmount(5);

				if(mapper.reservPage(cri)!=null) {
				PagingVO paging = new PagingVO(cri, mapper.reservPage(cri));
					model.addAttribute("page", paging);// 페이징 수
				}
				model.addAttribute("member",memDao.memberSearch(m_id));
				model.addAttribute("m_id",m_id);
				model.addAttribute("reservation", mapper.reservationPageList(cri));// 페이징 리스트
				
				vo.setM_id(m_id);
				return "reservation/reservation";
			}
		}
		return "reservation/reservation";
	}

	// 파트너 예약조회
	@RequestMapping("/preservationSelect")
	public String pReservationSelect(Model model,HttpServletRequest request,PreservationVO vo,Criteria cri,Principal principal) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
					
				String p_id = userDetails.getPmember().getP_id();
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
				vo.setP_id(p_id);
				cri.setP_id(p_id);
				cri.setAmount(15);
				System.out.println("cri=========="+cri);
				if(pmapper.preservPage(cri) != null) {
					PagingVO paging = new PagingVO(cri, pmapper.preservPage(cri));
					model.addAttribute("page", paging);// 페이징 수
				}
					model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));	
					model.addAttribute("preservation", pmapper.preservationPageList(cri));
					return "reservation/preservation";
			}
		}
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
	  public List<PreservationVO> noUpdate(@RequestParam("rno") int rno,@RequestParam("refuse") String refuse ,Model model,PreservationVO vo,HttpServletRequest request,Principal principal) {
		  if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "파트너회원") {
					String p_id = userDetails.getPmember().getP_id();
					System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
					vo.setP_id(p_id);
					System.out.println(rno);
					reservationDao.noUpdate(rno,refuse);
					List<PreservationVO> list = pReservationDao.preservationlist(vo);
					System.out.println(list);
					return list;
				}
		  }
		  return null;
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
		  System.out.println("====================================예약 체크" + reservCountDao.reservCountSelect(vo));
		  return reservCountDao.reservCountSelect(vo);
	  }
	  //예약등록
	  @PostMapping("/reservinsert")
	  @ResponseBody
	  public int reservInsert(ReservationVO vo,ReservCountVO co,ServiceVO so,PmemberVO po) {
		  
		  int price = 20000;
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
	  
	  @PostMapping("servicePay")
	  @ResponseBody
	  public ServiceVO servicePay(int r_no) {
		  return serviceDao.serviceSelect(r_no);
	  }
	  
	  
	  @RequestMapping("reviewWrithForm")
	  @ResponseBody
	  public ReservationVO reviewWrithForm(int r_no) {
		  return reservationDao.reviewWrithForm(r_no);
	  }
	 
	  
	  @RequestMapping("rnoreview")
	  @ResponseBody
	  public ReservationVO rnoreview(int r_no) {
		  return reservationDao.rnoreview(r_no);
	  }
	  
	  @PostMapping("autoCode")
	  @ResponseBody
	  public int autoCode(@RequestParam("pet_no")int pet_no){
		  return petDAO.AutoCode(pet_no);
	  }
	  
}
