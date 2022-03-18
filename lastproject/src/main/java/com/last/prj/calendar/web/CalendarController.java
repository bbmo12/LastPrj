package com.last.prj.calendar.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.calendar.service.CalendarService;
import com.last.prj.calendar.service.CalendarVO;
import com.last.prj.pmember.service.PmemberService;
import com.last.prj.reserv.service.ReservCountService;
import com.last.prj.reserv.service.ReservCountVO;
import com.last.prj.security.CustomUser;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService CalendarDao;
	@Autowired
	private PmemberService pMemberDao;
	@Autowired
	private ReservCountService reservCountDao;
	
	
	//파트너회원 예약설정 조회
	@PostMapping("revsetlist")
	@ResponseBody
	public List<CalendarVO> revSetList(HttpServletRequest request,CalendarVO vo,Model model){
		List<CalendarVO> list = CalendarDao.revSetList(vo);
		System.out.println(list);
		System.out.println(vo);
		
		return list;
	}
	//파트너회원 예약설정 등록
	@PostMapping("revsetinsert")
	@ResponseBody
	public CalendarVO revSetInsert(CalendarVO vo,HttpServletRequest request,Principal principal) {
		 if(principal != null) {
				CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(userDetails.getRole() == "파트너회원") {
					String p_id = userDetails.getPmember().getP_id();
					System.out.println("====유저디테일 pid : " + userDetails.getPmember().getP_id());
					System.out.println("====유저디테일 pname : " + userDetails.getPmember().getName());
					vo.setP_id(p_id);
					CalendarDao.revSetInsert(vo); //등록
					return vo;
				}
		 }
		return null;
	}
	
	//파트너회원 예약설정 삭제
	@PostMapping("revsetdelete")
	@ResponseBody
	public String revSetDelete(@RequestParam("p_id")String p_id,CalendarVO vo,ReservCountVO rco) {
		
		List<ReservCountVO> list = reservCountDao.reservDelCheck(rco);
		System.out.println("요기 셀렉결과창"+ list); 
		if(list.size()==0) {
			CalendarDao.revSetDelete(vo);
			return "ok";
		}else {
			return "no";
		}
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
	public Map<String,Object> revSetUpdateSelect(@RequestParam("id")int id,ReservCountVO vo) {
		Map<String,Object> map = new HashMap<>();
		CalendarVO cal = CalendarDao.revSetUpdateSelect(id);
		map.put("schedule",cal);
		vo.setStart_date(cal.getC_start());
		vo.setEnd_date(cal.getC_end());
		vo.setP_id(cal.getP_id());
		map.put("timeList", reservCountDao.reservCountSelect(vo));
		return map;
	}
}
