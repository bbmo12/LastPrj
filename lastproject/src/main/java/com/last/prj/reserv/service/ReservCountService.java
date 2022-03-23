package com.last.prj.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReservCountService {
	
	List<ReservCountVO> reservCountList();
	
	List<ReservCountVO> reservCountSelect(ReservCountVO vo);
	
	int reservCountInsert(ReservCountVO no);
	
	List<ReservCountVO> reservDelCheck(ReservCountVO vo); //일정삭제시 해당일자 예약일정체크
	
	int reservdateUpdate(ReservCountVO vo); //start_date,end_date 업데이트로 값 넣기
	
	int countUpdate(ReservCountVO vo); //예약번호 등록합시다
	
	int countDelete (ReservCountVO vo); //예약번호와 p_id조회해서 예약체크값 
	
	
}
