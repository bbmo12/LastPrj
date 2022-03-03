package com.last.prj.calendar.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.calendar.service.CalendarService;
import com.last.prj.calendar.service.CalendarVO;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService CalendarDao;
	
	
	//파트너회원 예약설정 조회
	@RequestMapping("revsetlist")
	@ResponseBody
	public List<CalendarVO> revSetList(HttpServletRequest request,CalendarVO vo){
		//로그인 세션값
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		System.out.println("p_id : " +p_id);
		vo.setP_id(p_id);
		List<CalendarVO> list = CalendarDao.revSetList(vo);
		System.out.println(list);
		return list;
	}
	//파트너회원 예약설정 등록
	@PostMapping("revsetinsert")
	@ResponseBody
	public CalendarVO revSetInsert(CalendarVO vo,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("pId");
		System.out.println("p_id : " +p_id);
		vo.setP_id(p_id);
		CalendarDao.revSetInsert(vo); //등록
		return vo;
		
	}
	
	//파트너회원 예약설정 삭제
	@PostMapping("revsetdelete")
	@ResponseBody
	public String revSetDelete(CalendarVO vo) {
		CalendarDao.revSetDelete(vo);
		return "ok";
	}
	
	//파트너회원 예약설정 수정
	@PostMapping("revsetupdate")
	@ResponseBody
	public CalendarVO revSetUpdate(CalendarVO vo) {
		CalendarDao.revSetUpdate(vo);
		return vo;
	}
	
	//일반회원 예약하기
	@PostMapping("revSetUpdateSelect")
	@ResponseBody
	public List<CalendarVO> revSetUpdateSelect(@RequestParam("id")int id,CalendarVO cal) {
		System.out.println(CalendarDao.revSetUpdateSelect(id));
		System.out.println(id);
		return CalendarDao.revSetUpdateSelect(id);
	}
}
