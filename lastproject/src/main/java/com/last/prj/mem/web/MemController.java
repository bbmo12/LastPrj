package com.last.prj.mem.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PmemService;
import com.last.prj.mem.service.PmemVO;

@Controller
public class MemController {

	@Autowired
	private MemService memDao;

	@Autowired
	private PmemService pmemDao;
	
	@Autowired
	ServletContext sc;
	
	//일반회원 정보수정
	@RequestMapping("memberUpdate")
	public String memberUpdate(@RequestParam("file") MultipartFile file, MemVO member, Model model, @Param("m_id") String m_id) {
		
		String originalFileName = file.getOriginalFilename();

		String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);
		

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
				member.setPicture(originalFileName);
				member.setPfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute(memDao.memberUpdate(member));
		model.addAttribute(memDao.memberSearch(m_id));
		
		return "mypage/memberMypage";
	}
		
	
	
	
	
	//내정보 수정페이지로 이동
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateFrom(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		model.addAttribute("member",memDao.memberSearch(m_id));
		return "mypage/memberUpdateForm";
	}
	//내정보페이지로 이동
	@RequestMapping("/memberMypage")
	public String memberMypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");
		model.addAttribute("member",memDao.memberSearch(m_id));
		return "mypage/memberMypage";
	}

	@RequestMapping("joinForm") // 일반회원회원가입폼이동
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping("pjoinForm") // 파트너회원회원가입폼 이동
	public String pjoinForm() {
		return "member/pjoinForm";
	}
	
	@RequestMapping("loginForm") // 일반회원로그인화면
	public String loginForm() {

		return "member/loginForm";
	}

	@RequestMapping("/login") // 일반회원로그인창
	public String loginForm(MemVO member, HttpSession session) {
		member = memDao.memberSelect(member);

		if (member != null) {
			session.setAttribute("member", member);
			session.setAttribute("mId", member.getM_id());
			session.setAttribute("password", member.getPassword());
			
		} else {
			return "member/loginForm";
		}
		
		return "redirect:home";
	}

	
	
	@RequestMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping("/plogin") // 파트너회원 로그인
	public String plogin(PmemVO pmember, HttpSession session) {
		pmember = pmemDao.pmemberSelect(pmember);

		if (pmember != null) {
			session.setAttribute("pmember", pmember);
			session.setAttribute("pId", pmember.getP_id());
			session.setAttribute("password", pmember.getPassword());
		} else {
			return "member/loginForm";
		}
		
		return "redirect:home";
	}

	@RequestMapping("/memberIdSearchForm") // 일반회원 아이디찾기 폼으로 이동
	public String memberIdSearchForm() {
		return "member/memIdSearchForm";
	}
	
	@RequestMapping("/pmemberIdSearch") //파티너회원 아이디 찾기
	@ResponseBody
	public String pmemberIdSearch(@Param("name") String name, @Param("tel") String tel) {
		return pmemDao.pmemberIdSearch(name, tel);
	}
	
	@RequestMapping("/memberIdSearch") //일반회원 아이디 찾기
	@ResponseBody
	public String memberIdSearch(@Param("name") String name, @Param("tel") String tel) {
		return memDao.memberIdSearch(name, tel);
	}
	
	
	  @RequestMapping("/mjoin") //일반회원 회원가입
	  public String mjoin(@RequestParam("file") MultipartFile file, MemVO member, Model model) {
	  String originalFileName = file.getOriginalFilename();
	  
	  String webPath = "/resources/upload";
		String realPath = sc.getRealPath(webPath);
	  
		File savePath = new File(realPath);
		if (!savePath.exists())
			savePath.mkdirs();

		realPath += File.separator + originalFileName;
		File saveFile = new File(realPath);
	  
	  if(!originalFileName.isEmpty()) {
		  String uuid = UUID.randomUUID().toString();
		  String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
	  
	  try {
		  file.transferTo(saveFile);
	  member.setPicture(originalFileName);
	  member.setPfile(saveFileName);
	  
	  } catch(Exception e) {
		  e.printStackTrace();
	  	}
	  }
	  
	  model.addAttribute(memDao.memberInsert(member)); 
	 
	  
	  return "home/home";
	  }
	  
	  @RequestMapping("/pjoin_1") //파트너회원 회원가입 1차
	  public String pjoin_1(@RequestParam("file") MultipartFile file, PmemVO pmember, Model model) {
		  String originalFileName = file.getOriginalFilename();
		  
		  String webPath = "/resources/upload";
			String realPath = sc.getRealPath(webPath);
		  
			File savePath = new File(realPath);
			if (!savePath.exists())
				savePath.mkdirs();

			realPath += File.separator + originalFileName;
			File saveFile = new File(realPath);

			
		  if(!originalFileName.isEmpty()) {
			  String uuid = UUID.randomUUID().toString();
			  String saveFileName = uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
		  
			  try {
				  file.transferTo(saveFile);
			  pmember.setPicture(originalFileName);
			  pmember.setPfile(saveFileName);
			  
			  } catch(Exception e) {
				  e.printStackTrace();
			  }
	  }
		  model.addAttribute(pmemDao.pmemberInsert1(pmember));
		  return "member/pjoinForm2";
	  }
	  
	  
	  
	 
	  @RequestMapping("/join") // 회원가입폼 이동
		public String login() {
			return "member/join";
		}
	
		
		  @RequestMapping("/jusoPopup") public String test() { return
		  "member/jusoPopup"; }
		 
}