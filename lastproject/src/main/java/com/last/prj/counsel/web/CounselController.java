package com.last.prj.counsel.web;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.counsel.service.CounselMapper;
import com.last.prj.counsel.service.CounselService;
import com.last.prj.counsel.service.CounselVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.ReviewVO;
import com.last.prj.security.CustomUser;

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

	public String mycounsel(Model model, Principal principal, CounselVO counsel, Criteria cri) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "일반회원") {
				String m_id = userDetails.getMember().getM_id();
				cri.setM_id(m_id);
				cri.setAmount(10);
				if(mapper.myCounselPage(cri) != null) {
					PagingVO paging = new PagingVO(cri, mapper.myCounselPage(cri));
					model.addAttribute("page", paging);// 페이징 수
				}
				model.addAttribute("member", memDao.memberSearch(m_id));
				model.addAttribute("mycounsel", mapper.myCounselList(cri));
				return "mypage/mcounselSearch";
			}
		}
		return "mypage/mcounselSearch";
		
	}

	// 파트너회원 상담내역
	@RequestMapping("/pmemcounsel")

	public String pmemcounsel(Model model, Principal principal, Criteria cri) {
		if(principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getRole() == "파트너회원") {
				String p_id = userDetails.getPmember().getP_id();
				cri.setP_id(p_id);
				cri.setAmount(10);
				PagingVO paging = new PagingVO(cri, mapper.counselPage(cri));
				model.addAttribute("page", paging);
				model.addAttribute("pmember", pMemberDao.getPmemberinfo(p_id)); // pmember 상세정보
				model.addAttribute("pmemcounsel", mapper.pmemCounselList(cri));// 페이징
				
				return "mypage/pmemcounsel";
			}
		}
		return "mypage/pmemcounsel";
	}

	// 상담 상세 조회 + 각 멤버 정보 + 펫 정보 담아감.

	@RequestMapping(value = "/csDetail", method = RequestMethod.GET)
	public String csDetail(@RequestParam("p_id") String p_id, @RequestParam("m_id") String m_id,
			@RequestParam("pet_no") int pet_no, @RequestParam("c_no") int c_no, Model model, Principal principal) {
	
		if (principal != null) {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "일반회원") {
				String mId = userDetails.getMember().getM_id();
				model.addAttribute("mId", mId);
			} else if (userDetails.getRole() == "파트너회원") {
				String pId = userDetails.getPmember().getP_id();
				model.addAttribute("pId", pId);

			}
		}
		model.addAttribute("mInfo", memDao.memberOne(m_id));
		model.addAttribute("pInfo", pMemberDao.PmemberOne(p_id));
		model.addAttribute("petInfo", petDAO.petOne(pet_no));
		model.addAttribute("csDetail", counselDao.csDetail(c_no));
		model.addAttribute("oneCs", counselDao.oneCs(c_no));

		return "mypage/csDetail";

	}

	// 기존 채팅방 존재 여부 확인 후 새로운 상담글 폼으로 이동 + p_id 정보 + m_id별 펫정보 받아감.
	@RequestMapping(value = "/EnterCs")
	public String EnterCs(@RequestParam("p_id") String p_id, Principal principal, HttpServletRequest request,
			HttpServletResponse response, Model model, CounselVO counsel, Criteria cri) throws Exception {

		String mId = "";

		if (principal != null) {

			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "일반회원") {
				mId = userDetails.getMember().getM_id();
				model.addAttribute("mId", mId);
			}
		}

		if (counselDao.isExist(mId, p_id) > 0) {
			// 기존 상담 여부 체크
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_writer = response.getWriter();
			out_writer.println("<script>alert('이미 진행 중인 상담이 있습니다. 상담 내역 페이지에서 확인하세요.');"
					+ "location.href='mycounsel';</script>");
			out_writer.flush();

			return null;

		} else {
			// 새로운 상담 폼으로 이동
			model.addAttribute("petList", petDAO.petmemberList(mId));
			model.addAttribute("pInfo", pMemberDao.PmemberOne(p_id));

			return "counsel/newCsForm";
		}
	}

	// 새로운 상담 등록
	@PostMapping("/newCs")
	public String newCs(HttpServletRequest request, CounselVO cs, HttpServletResponse response, Model model) throws Exception {
		
		counselDao.newCs(cs);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out_writer = response.getWriter();
		out_writer.println("<script>alert('상담이 등록되었습니다.');"
				+ "location.href='mycounsel';</script>");
		out_writer.flush();


		return null;
	}

	// 메시지 ajax
	@RequestMapping(value = "/newCsAns", method = { RequestMethod.POST, RequestMethod.GET })
	public String newAns(@RequestParam("p_no") int p_no, Principal principal, Model model, HttpServletRequest request, CounselVO cs) throws Exception {

		if (principal != null) {

			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (userDetails.getRole() == "일반회원") {
				String mId = userDetails.getMember().getM_id();
				model.addAttribute("mId", mId);
			} else if (userDetails.getRole() == "파트너회원") {
				String pId = userDetails.getPmember().getP_id();
				model.addAttribute("pId", pId);
				counselDao.codeUpd(p_no);
			}
		}
		counselDao.newCsAns(cs);

		return "mypage/csDetail";
	}

	// 상담 종료 ajax
	@RequestMapping(value = "/CodeUdt", method = RequestMethod.GET)
	public String CodeUdt(@RequestParam("p_no") int p_no, Model model) throws Exception {

		counselDao.CodeUdt(p_no);

		return "mypage/csDetail";
	}
	
	
	/*
	 * @RequestMapping("counselReviewInsert") public String
	 * counselReviewInsert(HttpServletRequest request, ReviewVO review, CounselVO
	 * vo) {
	 * 
	 * return ; }
	 */
}
