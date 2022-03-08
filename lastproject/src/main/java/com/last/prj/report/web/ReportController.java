package com.last.prj.report.web;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.mem.service.MemService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.report.service.ReportMapper;
import com.last.prj.report.service.ReportService;

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
	public String myreport(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		
		model.addAttribute("member",memDao.memberSearch(m_id));
		model.addAttribute("report", reportDao.myReportList(m_id));
		
		
		return "mypage/mreport";
	}
	@RequestMapping("/pmemreport")
	public String pmemreport(Model model, HttpServletRequest request, Criteria cri) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		cri.setReporter(p_id);
		cri.setAmount(10);
		PagingVO paging = new PagingVO(cri, mapper.pmemReport(cri));
		model.addAttribute("page", paging);
		model.addAttribute("pmemreport", mapper.pmemReportList(cri));
		model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id));
		return "mypage/pmemreport";
	}
	
}
