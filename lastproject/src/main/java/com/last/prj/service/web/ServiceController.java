package com.last.prj.service.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.security.CustomUser;
import com.last.prj.service.service.ServiceMapper;
import com.last.prj.service.service.ServiceService;
import com.last.prj.service.service.ServiceVO;

@Controller
public class ServiceController {

	@Autowired
	private ServiceService serviceDao;
	@Autowired
	private MemService memDao;
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private PetService petDAO;
	@Autowired
	private ServiceMapper mapper;
	
	@Autowired
	private ReservationService reservationDao;
	
	
	@RequestMapping("/protocol")
	public String protocol(Model model,Principal principal) {
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				model.addAttribute("member", memDao.memberSearch(m_id));
				model.addAttribute("service", serviceDao.myPetServiceList(m_id));
				model.addAttribute("reservation",reservationDao.reservationSelect(m_id));
				System.out.println("프로토콜");
				System.out.println(serviceDao.myPetServiceList(m_id));
				return "mypage/petprotocol";
			}
		}
		return null;
	}
	
	/*
	 * @RequestMapping("/petProtoColSearch")
	 * 
	 * @ResponseBody public List<ServiceVO>
	 * petProtoColSearch(@RequestParam("key")String key, @RequestParam("data")String
	 * data, @RequestParam("m_id") String m_id, ServiceVO vo){
	 * System.out.println("key : " + key); System.out.println("data : "+data);
	 * System.out.println("m_id :"+ m_id);
	 * 
	 * 
	 * 
	 * System.out.println("여기가 vo:" + vo);
	 * 
	 * 
	 * 
	 * return serviceDao.petProtoColSearch(key, data, m_id); }
	 */
	
	
	//파트너회원 내 수익조회
	@RequestMapping("pMembenefit")
	public String pMembenefit(Model model,Principal principal,ServiceVO vo, Criteria cri) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
				String p_id = userDetails.getPmember().getP_id();
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
				cri.setAmount(10);
				cri.setP_id(p_id);
				PagingVO paging = new PagingVO(cri, mapper.pMembenefitTotal(cri));
				model.addAttribute("page", paging);
				List<ServiceVO> list = serviceDao.pMembenefit(cri);
				model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));		
				model.addAttribute("pMembenefit",list);
				model.addAttribute("totalPrice",serviceDao.totalPrice(p_id));
				return "mypage/Mybenefit";
			}
		}
		return null;
	}
	
	
	
	  @RequestMapping("PetServiceList")
	  @ResponseBody
	  public HashMap<String, Object> PetServiceList(ServiceVO vo, Criteria cri, Principal principal){
		  if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				vo.setM_id(m_id);
				System.out.println(vo);
				int total = serviceDao.petServiceCnt(vo);
				
				PagingVO page = new PagingVO(cri,total);
				HashMap map = new HashMap();
				vo.setVo(page);
				
				
				map.put("list", serviceDao.petService(vo));
				map.put("page",page);
				
				System.out.println("============================="+vo);
				
				
				return map;
			}
		  }
		  return null;
	  }
	 
	 
	
	
}
