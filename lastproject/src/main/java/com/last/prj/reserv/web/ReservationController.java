package com.last.prj.reserv.web;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
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
import com.last.prj.mem.service.PetcareVO;
import com.last.prj.pay.service.PayService;
import com.last.prj.pay.service.PayVO;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.reserv.service.PreservationVO;
import com.last.prj.reserv.service.PreservationlistMapper;
import com.last.prj.reserv.service.PreservationlistService;
import com.last.prj.reserv.service.ReservCountService;
import com.last.prj.reserv.service.ReservCountVO;
import com.last.prj.reserv.service.ReservationMapper;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;
import com.last.prj.reserv.service.ReviewVO;
import com.last.prj.security.CustomUser;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;

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
	

	
	// ?????? ????????????
	@RequestMapping("/reservationSelect")
	public String nReservationSelect(Model model, ReservationVO vo,HttpServletRequest request,Criteria cri,Principal principal) {
		
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "????????????") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
				System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
				cri.setM_id(m_id);
				cri.setAmount(10);
				int d =mapper.reservPage(cri);
				if( d !=0 ) {
					PagingVO paging = new PagingVO(cri, d);
					model.addAttribute("page", paging);// ????????? ???
				}
				model.addAttribute("member",memDao.memberSearch(m_id));
				model.addAttribute("m_id",m_id);
				model.addAttribute("reservation", mapper.reservationPageList(cri));// ????????? ?????????
				
				vo.setM_id(m_id);
				return "reservation/reservation";
			}
		}
		return "reservation/reservation";
	}
	
	
	
	//???????????? ???????????????
	@RequestMapping("/reservMember")
	public String reservation(@RequestParam("p_id")String p_id, Model model,HttpServletRequest request,CalendarVO co,PetVO po,PmemberVO pmo,HttpServletResponse response, Principal principal,PetcareVO petcare) throws Exception {
		
			if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "????????????") {
					String m_id = userDetails.getMember().getM_id();
					System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
					System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
					co.setP_id(p_id);
					po.setM_id(m_id);
					pmo.setP_id(p_id);
					
					System.out.println("ddddddddddddddddddddddddddddddd");
					System.out.println(memDao.careList(p_id));
					List<PetcareVO> careList = memDao.careList(p_id);
					//???????????????
					List<CalendarVO> list = CalendarDao.revSetList(co);
					
					//???????????????
					List <PetVO> petList = petDAO.petmemberList(userDetails.getMember().getM_id());
					
					//??? ???????????? ???????????????
					List <PetVO> petCode = petDAO.petCodeSearch(userDetails.getMember().getM_id());
					
					//?????????????????? ???
					model.addAttribute("careList",careList);
					model.addAttribute("petList",petList);
					model.addAttribute("petCode",petCode);
					model.addAttribute("reservset",list);
					//?????? ??????????????? ????????????
					model.addAttribute("pmember", pMemberDao.PmemberOne(p_id));
					System.out.println(list);
					System.out.println(petList);
					return "reservation/reservMember";
					
				}
		}
			//????????? ?????????????????? ??????
			response.setContentType("text/html; charset=utf-8"); PrintWriter out =
			response.getWriter();
			out.println("<script>alert('???????????? ????????? ??????????????????.'); </script>"); out.flush();
			return "member/loginForm"; 
	}
		
	//??????????????? ????????????
	@RequestMapping("/reservationSetting")
	public String reservationSetting(Model model,PreservationVO pres,HttpServletRequest request,Principal principal) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "???????????????") {
				model.addAttribute("p_id",userDetails.getPmember().getP_id());
				return "reservation/resvSetting";
			}
		}
		
		return "reservation/resvSetting";
	}
	
	
	// ???????????? ??? ????????????(ajax)
	@RequestMapping("/reservationSelect1")
	@ResponseBody
	public HashMap<String, Object> reservationSelect1(ReservationVO vo, Criteria cri,Principal principal) {
			 if(principal != null) {
					CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					if(userDetails.getRole() == "????????????") {
						String m_id = userDetails.getMember().getM_id();
						System.out.println("====??????????????? mid : " + userDetails.getMember().getM_id());
						System.out.println("====??????????????? mname : " + userDetails.getMember().getName());
						vo.setM_id(m_id);
						System.out.println(vo);
						int total = reservationDao.reservPage1(vo);
						
						PagingVO page = new PagingVO(cri,total);
						HashMap map = new HashMap();
						vo.setVo(page);
						
						
						map.put("list", reservationDao.reservationPageList1(vo));
						map.put("page",page);
						
						System.out.println("============================="+vo);
						
						
						return map;
					}
				  }
		
		return null;
	}

	// ????????? ????????????
	@RequestMapping("/preservationSelect")
	public String pReservationSelect(Model model,HttpServletRequest request,PreservationVO vo,Criteria cri,Principal principal) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "???????????????") {
					
				String p_id = userDetails.getPmember().getP_id();
				System.out.println("====??????????????? pid : " + userDetails.getPmember().getP_id());
				System.out.println("====??????????????? pname : " + userDetails.getPmember().getName());
				vo.setP_id(p_id);
				cri.setP_id(p_id);
				cri.setAmount(15);
				System.out.println("cri=========="+cri);
				if(pmapper.preservPage(cri) != null) {
					PagingVO paging = new PagingVO(cri, pmapper.preservPage(cri));
					model.addAttribute("page", paging);// ????????? ???
				}	
					model.addAttribute("p_id",p_id);
					model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));	
					model.addAttribute("preservation", pmapper.preservationPageList(cri));
					return "reservation/preservation";
			}
		}
		return "reservation/preservation";
	}
	
	  //??????????????? ???????????? ??? ??????(ajax)
	  @PostMapping("/okupdate")
	  @ResponseBody 
	  public String okUpdate(@RequestParam("rno") int rno) {
		  System.out.println(rno);
		  reservationDao.okUpdate(rno);
		  
		  return "ok";
	  }
	  
	  //??????????????? ???????????? ?????? ??????(ajax)
	  @PostMapping("/noupdate")
	  @ResponseBody 
	  public List<PreservationVO> noUpdate(@RequestParam("r_no") int rno,@RequestParam("refuse") String refuse ,Model model,PreservationVO vo,HttpServletRequest request,Principal principal,ReservCountVO revo) {
		  if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "???????????????") {
					String p_id = userDetails.getPmember().getP_id();
					vo.setP_id(p_id);
					revo.setP_id(p_id);
					reservationDao.noUpdate(rno,refuse);
					System.out.println("???????????????????????????????????????????????????????????????????????????????????????????????????????????????");
					System.out.println(reservCountDao.countDelete(revo));
					reservCountDao.countDelete(revo);
					List<PreservationVO> list = pReservationDao.preservationlist(vo);
					System.out.println(list);
					return list;
				}
		  }
		  return null;
	  }
	  
	  //???????????? ???????????? ??? ???????????? + ???????????? ??????
	  @PostMapping("/payupdate")
	  @ResponseBody 
	  public String payUpdate(@RequestParam("r_no") int r_no,@RequestParam("m_id")String m_id, PayVO po) {
		  System.out.println(r_no);
		  reservationDao.payUpdate(r_no);
		  
		  //???????????? ??????
		  payDao.payInsert(po);
		  return "ok";
	  }

		/*
		 * //????????? ??????/?????? ??????
		 * 
		 * @PostMapping("/reservcount")
		 * 
		 * @ResponseBody public ReservCountVO reservCountSelect(ReservCountVO vo) {
		 * System.out.println("====================================?????? ??????" +
		 * reservCountDao.reservCountSelect(vo)); return
		 * reservCountDao.reservCountSelect(vo); }
		 */
	  //????????????
	  @PostMapping("/reservinsert")
	  @ResponseBody
	  public int reservInsert(@RequestParam("p_id")String p_id,ReservationVO vo,ReservCountVO co,ServiceVO so,PmemberVO po) {
		  vo.setR_code("401");
		  
		  int price = 20000;
		  String content;
		  String enddate = "??????";
		  //????????????
		  reservationDao.reservInsert(vo);
		  
		  //?????? ????????? ???????????? ??????
		  int p_code = pMemberDao.pMemCode(p_id);
		  //???????????? , ?????????
		  co.setReserv_date(vo.getR_date());
		  co.setReserv_time(vo.getTime());
		  
		  if(p_code==100) {
			  content="??????";
		  }else if(p_code==101){
			  content="??????";
		  }else if(p_code==102) {
			  content ="??????";
		  }else {
			  content="?????????";
		  }
			  
		  so.setR_no(vo.getR_no());
		  so.setStartdate(vo.getR_date());
		  so.setP_id(vo.getP_id());
		  so.setContent(content);
		  so.setPrice(price);
		  so.setEnddate(enddate);
		  so.setCode(p_code);
		  //?????????????????????
		  serviceDao.ServiceInsert(so);
		  //??????????????? ??? ??????
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
	  public ReviewVO rnoreview(int r_no, Model model,ReviewVO review) {
		  model.addAttribute("picture", reservationDao.readpicture(r_no));
		  System.out.println(reservationDao.readpicture(r_no));
		  return reservationDao.rnoreview(r_no);
	  }
	  
	  @PostMapping("autoCode")
	  @ResponseBody
	  public int autoCode(@RequestParam("pet_no")int pet_no){
		  return petDAO.AutoCode(pet_no);
	  }
	  
}
