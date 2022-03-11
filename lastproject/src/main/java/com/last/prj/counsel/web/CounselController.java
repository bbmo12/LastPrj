package com.last.prj.counsel.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.counsel.service.CounselMapper;
import com.last.prj.counsel.service.CounselService;
import com.last.prj.counsel.service.CounselVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;

@Controller
public class CounselController {

	@Autowired
	private CounselService counselDao;

	@Autowired
	private MemService memDao;

	@Autowired
	private PmemberService pMemberDao;

	@Autowired
	private PetService petDAO;

	@Autowired
	private CounselMapper mapper;

	@RequestMapping("/mycounsel")
	public String mycounsel(Model model, HttpServletRequest request, CounselVO counsel, Criteria cri) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		cri.setM_id(m_id);
		cri.setAmount(10);

		PagingVO paging = new PagingVO(cri, mapper.myCounselPage(cri));

		model.addAttribute("page", paging);// 페이징 수
		model.addAttribute("member", memDao.memberSearch(m_id));
		model.addAttribute("mycounsel", mapper.myCounselList(cri));

		return "mypage/mcounselSearch";
	}

	// 파트너회원 상담내역
	@RequestMapping("/pmemcounsel")
	public String pmemcounsel(Model model, HttpServletRequest request, Criteria cri) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		cri.setP_id(p_id);
		cri.setAmount(10);
		PagingVO paging = new PagingVO(cri, mapper.counselPage(cri));
		model.addAttribute("page", paging);
		model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); // pmember 상세정보
		model.addAttribute("pmemcounsel", mapper.pmemCounselList(cri));// 페이징

		return "mypage/pmemcounsel";
	}

	// 상담 상세 조회 + 각 멤버 정보 + 펫 정보 담아감.

	@RequestMapping(value = "/csDetail", method = RequestMethod.GET)
	public String csDetail(@RequestParam("p_id") String p_id, @RequestParam("m_id") String m_id,
			@RequestParam("pet_no") int pet_no, @RequestParam("c_no") int c_no, Model model) {

		model.addAttribute("mInfo", memDao.memberOne(m_id));
		model.addAttribute("pInfo", pMemberDao.PmemberOne(p_id));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));
		model.addAttribute("csDetail", counselDao.csDetail(c_no));
		model.addAttribute("oneCs", counselDao.oneCs(c_no));

		return "mypage/csDetail";

	}

	// 기존 채팅방 존재 여부 확인 후 새로운 상담글 폼으로 이동 + p_id 정보 + m_id별 펫정보 받아감.
	@RequestMapping(value = "/EnterCs")
	public String EnterCs(@RequestParam("m_id") String m_id, @RequestParam("p_id") String p_id, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, CounselVO counsel, Criteria cri)
			throws Exception {
		
		String mId = (String) session.getAttribute("mId");
		
		if(mId == null) {
			//로그인 여부 체크
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_writer = response.getWriter();
			out_writer.println("<script>alert('먼저 로그인하세요.');</script>");
			out_writer.flush();

			return "member/loginForm";
		} else if(counselDao.isExist(m_id, p_id) > 0){
			//기존 상담 여부 체크
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_writer = response.getWriter();
			out_writer.println("<script>alert('이미 진행 중인 상담이 있습니다. 상담 내역 페이지에서 확인해주세요.');</script>");
			out_writer.flush();
			
			session = request.getSession();
			String mid = (String) session.getAttribute("mId");
			cri.setM_id(mid);
			cri.setAmount(10);
			
			return "redirect:/mycounsel";
		
		} else {
			//새로운 상담 폼으로 이동
			model.addAttribute("petList", petDAO.petmemberList(m_id));
			model.addAttribute("pInfo", pMemberDao.PmemberOne(p_id));
			return "counsel/newCsForm";
		}
	}
		

	// 새로운 상담 등록
	@PostMapping("/newCs")
	public String newCs(HttpServletRequest request, CounselVO cs) throws Exception {

		counselDao.newCs(cs);

		return "mypage/mcounselSearch";
	}

	// 메시지 ajax
	@RequestMapping(value = "/newCsAns", method = {RequestMethod.POST, RequestMethod.GET})
	public String newAns(@RequestParam("p_no") int p_no, HttpServletRequest request, CounselVO cs, HttpSession session) throws Exception {

		String pId = (String) session.getAttribute("pId");

		if (pId != null) {
			counselDao.codeUpd(p_no);
		}
		counselDao.newCsAns(cs);

		return "mypage/csDetail";
	}

	// 상담 종료 ajax
	@RequestMapping(value="/CodeUdt", method=RequestMethod.GET)
	public String CodeUdt(@RequestParam("p_no") int p_no, Model model) throws Exception{
		
		counselDao.CodeUdt(p_no);
		
		return "mypage/csDetail";
	}
}
