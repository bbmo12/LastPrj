package com.last.prj.pet.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.pet.service.PetService;

@Controller
public class PetController {
	
	@Autowired
	private PetService petDAO;
	
	@Autowired
	ServletContext sc;
	
	
	@RequestMapping("/petmemberForm")
	public String petmemberForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("mId");		
		model.addAttribute("pets", petDAO.petmemberList(m_id));
		System.out.println(petDAO.petmemberList(m_id));
		return "mypage/mpetprofile";
	}
	
	@RequestMapping("/petDetail") //펫 상세페이지
	public String petDetail(@RequestParam("pet_no") int pet_no, Model model) {
		
		model.addAttribute("pet", petDAO.petSearch(pet_no));
		return "mypage/petDetail";
	}
}
