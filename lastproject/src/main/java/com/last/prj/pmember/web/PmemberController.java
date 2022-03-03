package com.last.prj.pmember.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.pmember.service.PagingVO;
import com.last.prj.pmember.service.PmemberMapper;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.pmember.service.PmemberVO;
import com.last.prj.pmember.service.TimeVO;

@Controller
public class PmemberController {
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private PmemberMapper mapper;	
	@Autowired
	ServletContext sc;

	@RequestMapping("/pmemberList")
	public String pmemberList(@RequestParam("code") int code, Model model, Criteria cri) {
//		String json = new Gson().toJson(pMemberDao.memberList(code));
//		model.addAttribute("babo", json);
		cri.setAmount(12);
		PagingVO paging = new PagingVO(cri, mapper.memberPage(cri));
		
		model.addAttribute("page", paging);// 페이징 수
		model.addAttribute("pageList", mapper.memberPageList(cri));// 페이징 리스트
		return "pmember/memberList";
	}

	// 상세페이지
	@RequestMapping("/pmemberDetail")
	public String pmemberDetail(@RequestParam("id") String p_id, Model model) {
		// 파트너 정보
		model.addAttribute("pmemdetail", pMemberDao.getMember(p_id));
		System.out.println(pMemberDao.getMember(p_id));
		// 후기
		model.addAttribute("counsel", pMemberDao.getCounselReview(p_id));
		model.addAttribute("service", pMemberDao.getServiceReview(p_id));
		return "pmember/memberDetail";
	}

	@RequestMapping("/memberMain")
	public String home() {
		return "pmember/memberMain";
	}

	// 파트너 마이페이지
	@RequestMapping("pmemberMyPage")
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		model.addAttribute("pmember", pMemberDao.getMember(p_id));
		return "pmember/pmemberMypage";
	}

	// 파트너정보 수정페이지로 이동
	@RequestMapping("pmemberUpdateForm")
	public String pmemberUpdateFrom(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		
		model.addAttribute("pmember", pMemberDao.getMember(p_id));
		return "pmember/pmemberUpdateForm";
	}
	//마이페이지 수정 
	@PostMapping("pmemberUpdate")
    public String pmemberUpdate(@RequestParam("file") MultipartFile file, PmemberVO pmember, TimeVO time , Model model, HttpServletRequest request) {

		String originalFileName = file.getOriginalFilename();
		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);
		
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		
		
		File savePath = new File(realPath);
		if (!savePath.exists())
			savePath.mkdirs();

		realPath += File.separator + originalFileName;
		File saveFile = new File(realPath);

		if (!originalFileName.isEmpty()) {
			String uuid = UUID.randomUUID().toString();
			String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));

			try {
				file.transferTo(saveFile);
				pmember.setPicture(originalFileName);
				pmember.setPfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		pMemberDao.pmemberTime(time);
		pMemberDao.pmemberUpdate(pmember);
		model.addAttribute("pmember", pMemberDao.getMember(p_id));
		return "redirect:/pmemberMyPage";
	}

}
