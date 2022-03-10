package com.last.prj.service.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
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
	
	
	@RequestMapping("/protocol")
	public String protocol(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("member", memDao.memberSearch(m_id));
		model.addAttribute("service", serviceDao.myPetServiceList(m_id));
		
		System.out.println("프로토콜");
		System.out.println(serviceDao.myPetServiceList(m_id));
		
		
		return "mypage/petprotocol";
	}
	
	@RequestMapping("/petProtoColSearch")
	@ResponseBody
	public List<PetVO> petProtoColSearch(@RequestParam("key")String key, @RequestParam("data")String data, @RequestParam("m_id") String m_id, PetVO vo){
		System.out.println("key : " + key);
		System.out.println("data : "+data);
		System.out.println("m_id :"+ m_id);
		
		System.out.println("여기가 vo:" + vo);
		
		
		System.out.println(petDAO.petProtoColSearch(key, data,m_id));
		
		return petDAO.petProtoColSearch(key, data, m_id);
	}
	
	
	
	//파트너회원 내 수익조회
	@RequestMapping("pMembenefit")
	public String pMembenefit(Model model,HttpServletRequest request,ServiceVO vo) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		System.out.println("pMemDiaList============= p_id : " +p_id);
		
		List<ServiceVO> list = serviceDao.pMembenefit(p_id);
		model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));		
		model.addAttribute("pMembenefit",list);
		model.addAttribute("totalPrice",serviceDao.totalPrice(p_id));
		return "mypage/Mybenefit";
	}
	
	
	
	  @RequestMapping("PetServiceList")
	  @ResponseBody
	  public HashMap<String, Object> PetServiceList(ServiceVO vo, Criteria cri, HttpServletRequest request){
	  HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
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
