package com.last.prj.pet.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;

@Controller
public class PetController {
	
	@Autowired
	private PetService petDAO;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	ServletContext sc;
	
	
	@RequestMapping("/petmemberForm")
	public String petmemberForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");		
		model.addAttribute("pets", petDAO.petmemberList(m_id));
		model.addAttribute("member",memDao.memberSearch(m_id));
		System.out.println(petDAO.petmemberList(m_id));
		return "mypage/mpetprofile";
	}
	
	@RequestMapping("/petDetail") //펫 상세페이지
	public String petDetail(@RequestParam("pet_no") int pet_no, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");		
		model.addAttribute("pet", petDAO.petSearch(pet_no));
		model.addAttribute("member",memDao.memberSearch(m_id));
		return "mypage/petDetail";
	}
	
	@RequestMapping("/mypetAddForm")
	public String mypetAddForm() {
		return "mypage/mypeyAddForm";
	}
	
	@RequestMapping("/mypatadd")
	public String mypatadd(@RequestParam("file") MultipartFile file, PetVO pet, Model model, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");		
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
	    pet.setPicture(originalFileName);
	    pet.setPfile(saveFileName);
	  
	  } catch(Exception e) {
		  e.printStackTrace();
	  	}
	  }
	  model.addAttribute("member",memDao.memberSearch(m_id));
	  petDAO.mypetInsert(pet);
	  model.addAttribute("pets", petDAO.petmemberList(m_id));
	  return "mypage/mpetprofile";
	}

	
	//반려동물 수정페이지로 이동
	@RequestMapping("/mypetUpdateForm")
	public String mypetUpdateForm(Model model, @RequestParam("pet_no") int pet_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");		
		
		System.out.println("요기당당당당"+pet_no);
		
		model.addAttribute("pet",petDAO.petSearch(pet_no));
		 model.addAttribute("member",memDao.memberSearch(m_id));
		
		System.out.println(pet_no);
	
		return "mypage/mypetUpdateForm";
	}
	
	//반려동물 정보수정
	@RequestMapping("mypetupdate")
	public String mypetupdate(MultipartFile file, PetVO pet, Model model, @RequestParam("pet_no") int pet_no) {
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
				pet.setPicture(originalFileName);
				pet.setPfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("pet",petDAO.mypetupdate(pet_no));
		
		return "mypage/myPay";
	}
	
}
