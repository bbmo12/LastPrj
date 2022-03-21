package com.last.prj.report.web;



import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.report.service.ReportMapper;
import com.last.prj.report.service.ReportService;
import com.last.prj.report.service.ReportVO;
import com.last.prj.security.CustomUser;

@Controller
public class ReportController { 
		
	@Autowired
	private ReportService reportDao;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	private ReportMapper mapper;
	@Autowired
	private PmemberService pMemberDao;

	//<!-- 신고전체 리스트 -->

	
	//<!-- 신고 전체 건수 -->

	
	//<!-- 신고 유형에 따른 신고 건수 -->
	
	
	//일반회원 신고내역 조회
	@RequestMapping("/myreport")
	public String myreport(Model model, Principal principal, ReportVO report, Criteria cri) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				System.out.println("====유저디테일 m_id : " + userDetails.getMember().getM_id());
				cri.setReporter(m_id);
				cri.setAmount(10);
			
				PagingVO paging = new PagingVO(cri, mapper.memReport(cri));
				model.addAttribute("page",paging);
				model.addAttribute("member",memDao.memberSearch(m_id));
				model.addAttribute("report", reportDao.myReportList(cri));
			
				return "mypage/mreport";
			}
		}
		return null;
	}
	@RequestMapping("/pmemreport")
	public String pmemreport(Model model, Principal principal, Criteria cri) {
		 if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "파트너회원") {
					String p_id = userDetails.getPmember().getP_id();
					System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
					System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
					cri.setReporter(p_id);
					cri.setAmount(10);
					PagingVO paging = new PagingVO(cri, mapper.pmemReport(cri));
					model.addAttribute("page", paging);
					model.addAttribute("pmemreport", mapper.pmemReportList(cri));
					model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id));
					return "mypage/pmemreport";
				}
		 }
		 return null;
	}
	
}
