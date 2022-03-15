package com.last.prj.diagnosis.web;



import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.diagnosis.service.DiagnosisMapper;
import com.last.prj.diagnosis.service.DiagnosisService;
import com.last.prj.diagnosis.service.DiagnosisVO;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.security.CustomUser;
import com.last.prj.service.service.ServiceService;

@Controller
public class DiagnosisController {
	@Autowired
	private DiagnosisService diaDao;
	
	@Autowired
	ReservationService reservationDao;
	
	@Autowired
	ServiceService serviceDao;
	
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private DiagnosisMapper mapper;
	
	@PostMapping("diaInsert")
	@ResponseBody
	public int diaInsert(@RequestParam("r_no")int r_no , DiagnosisVO vo) {
		System.out.println(vo);
		diaDao.diagnosisInsert(vo);
		reservationDao.diaCodeUpdate(r_no);
		serviceDao.ServiceUpdate(r_no);
		return 1;
	}
	
	@RequestMapping("pMemDiaList")
	public String pMemDiaList(Model model,Principal principal, Criteria cri) {
		 if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "파트너회원") {
					String p_id = userDetails.getPmember().getP_id();
					System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
					System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
					cri.setAmount(10);
					cri.setP_id(p_id);
					PagingVO paging = new PagingVO(cri, mapper.pMemDiaTotal(cri));
					model.addAttribute("page", paging);
					List<DiagnosisVO> list = diaDao.pMemDiaList(cri);
					model.addAttribute("pMemDiaList",list);
					model.addAttribute("pmember",pMemberDao.getPmemberinfo(p_id));
					return "mypage/diagnosisList";
				}
		 }
		 return null;
	}
	
	
	
}
