package com.last.prj.diagnosis.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.diagnosis.service.DiagnosisService;
import com.last.prj.diagnosis.service.DiagnosisVO;
import com.last.prj.reserv.service.ReservationService;

@Controller
public class DiagnosisController {
	@Autowired
	private DiagnosisService diaDao;
	
	@Autowired
	ReservationService reservationDao;
	
	@PostMapping("diaInsert")
	@ResponseBody
	public int diaInsert(@RequestParam("r_no")int r_no , DiagnosisVO vo) {
		System.out.println(vo);
		diaDao.diagnosisInsert(vo);
		reservationDao.diaCodeUpdate(r_no);
		return 1;
	}
	
	
}
