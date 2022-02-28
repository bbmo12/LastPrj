package com.last.prj.calendar.web;

import java.util.List;

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
	public List<CalendarVO> revSetList(){
		List<CalendarVO> list = CalendarDao.revSetList();
		System.out.println(list);
		return list;
	}
	//파트너회원 예약설정 등록
	@PostMapping("revsetinsert")
	@ResponseBody
	public CalendarVO revSetInsert(CalendarVO vo,@RequestParam("c_start") String c_start,@RequestParam("c_end") String c_end
							,@RequestParam("category")String category,@RequestParam("title")String title) {
		vo.setTitle(title);
		vo.setCategory(category);
		vo.setC_start(c_start);
		vo.setC_end(c_end);
		System.out.println(c_start);
		System.out.println(c_end);
		CalendarDao.revSetInsert(vo); //등록
		System.out.println(CalendarDao.revSetSelectList());
		return CalendarDao.revSetSelectList(); //단건조회로 뷰
		
	}
	
	//파트너회원 예약설정 삭제
	@PostMapping("revsetdelete")
	@ResponseBody
	public String revSetDelete(@RequestParam("id")int id,CalendarVO vo) {
		vo.setId(id);
		CalendarDao.revSetDelete(vo);
		return "ok";
	}
	
	//파트너회원 예약설정 수정
	@PostMapping("revsetupdate")
	@ResponseBody
	public CalendarVO revSetUpdate(CalendarVO vo,@RequestParam("c_start") String c_start,@RequestParam("c_end") String c_end
			,@RequestParam("category")String category,@RequestParam("title")String title,@RequestParam("id")int id) {
		vo.setC_end(c_end);
		vo.setC_start(c_start);
		vo.setId(id);
		vo.setTitle(title);
		vo.setCategory(category);
		CalendarDao.revSetUpdate(vo);
		System.out.println(CalendarDao.revSetUpdateSelect(vo));
		return CalendarDao.revSetUpdateSelect(vo);
	}
}
