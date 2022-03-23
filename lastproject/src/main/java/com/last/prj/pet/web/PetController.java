package com.last.prj.pet.web;

import java.io.File;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.ServletContext; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.prj.mem.service.MemService;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.security.CustomUser;

@Controller
public class PetController {
	
	@Autowired
	private PetService petDAO;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	ServletContext sc;
	
	
	/*
	 * @RequestMapping("/petmemberForm") public String petmemberForm(Model
	 * model,Principal principal) { String m_id = "0"; if(principal != null) {
	 * 
	 * CustomUser userDetails = (CustomUser)
	 * SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	 * 
	 * if(userDetails.getRole() == "일반회원") { System.out.println("====유저디테일 mid : " +
	 * userDetails.getMember().getM_id()); System.out.println("====유저디테일 mname : " +
	 * userDetails.getMember().getName()); m_id =userDetails.getMember().getM_id();
	 * 
	 * }else if(userDetails.getRole() == "파트너회원") {
	 * System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
	 * System.out.println("====유저디테일 pname : " +
	 * userDetails.getPmember().getName()); }else if(userDetails.getRole() =="관리자")
	 * {
	 * 
	 * }
	 * 
	 * } model.addAttribute("pets", petDAO.petmemberList(m_id));
	 * model.addAttribute("member",memDao.memberSearch(m_id));
	 * System.out.println(petDAO.petmemberList(m_id)); return "mypage/mpetprofile";
	 * }
	 */
	
	@RequestMapping("/petDetail") //펫 상세페이지
	public String petDetail(@RequestParam("pet_no") int pet_no, Model model, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}		
		model.addAttribute("pet", petDAO.petSearch(pet_no));
		model.addAttribute("member",memDao.memberSearch(m_id));
		return "mypage/petDetail";
	}
	
	@RequestMapping("/mypetAddForm")
	public String mypetAddForm(Principal principal, Model model) {
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				String m_id =userDetails.getMember().getM_id();
				
				model.addAttribute("member",memDao.memberSearch(m_id));
				return "mypage/mypeyAddForm";
				
			}
		}
		return null;
	}
	
	@RequestMapping("/mypatadd")
	public String mypatadd(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttr,PetVO pet, Model model, Principal principal ) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}		
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
	  redirectAttr.addFlashAttribute("petadd","정보를다시확인해주세요.");
	  return "redirect:mainMypage";
	}

	
	//반려동물 수정페이지로 이동
	@RequestMapping("/mypetUpdateForm")
	public String mypetUpdateForm(Model model, @RequestParam("pet_no") int pet_no, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}
		
		model.addAttribute("pet",petDAO.petSearch(pet_no));
		 model.addAttribute("member",memDao.memberSearch(m_id));
		
		System.out.println(pet_no);
	
		return "mypage/mypetUpdateForm";
	}
	
	//반려동물 정보수정
	@RequestMapping("mypetupdate")
	public String mypetupdate(MultipartFile file, PetVO pet, Model model, @RequestParam("pet_no") int pet_no, RedirectAttributes redirectAttr, Principal principal) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}	
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
		model.addAttribute("pet",petDAO.mypetupdate(pet));
		model.addAttribute("pets",petDAO.petmemberList(m_id));
		model.addAttribute("member",memDao.memberSearch(m_id));
		redirectAttr.addFlashAttribute("petupdate","정보를다시확인해주세요.");
		
		
		return "redirect:mainMypage";
	}
	
	@RequestMapping("mypetDelete")
	public String mypetDelete(Principal principal, @RequestParam("pet_no")int pet_no, Model model,RedirectAttributes redirectAttr) {
		String m_id = "0";
		if(principal != null) {
			
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			if(userDetails.getRole() == "일반회원") {
				System.out.println("====유저디테일 mid : " + userDetails.getMember().getM_id());
				System.out.println("====유저디테일 mname : " + userDetails.getMember().getName());
				m_id =userDetails.getMember().getM_id();
				
			}else if(userDetails.getRole() == "파트너회원") {
				System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
				System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
			}else if(userDetails.getRole() =="관리자") {
				
			}
			
		}		
		 model.addAttribute("member",memDao.memberSearch(m_id));
		
		 petDAO.mypetDelete(pet_no);
		 model.addAttribute("pets", petDAO.petmemberList(m_id));
		 redirectAttr.addFlashAttribute("petdelete","정보를다시확인해주세요.");
		 return "redirect:mainMypage";
	}
	
	
}
