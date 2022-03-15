package com.last.prj.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.last.prj.pmember.service.Criteria;

public interface ReservationMapper {
	List<ReservationVO> reservationSelectList();
	
	List<ReservationVO> reservationSelect (ReservationVO vo);
	
	//예약승인
	int okUpdate(int res);
	
	//예약거절
	int noUpdate(@Param("rno")int rno,@Param("refuse")String refuse);
	
	//예약등록
	int reservInsert(ReservationVO vo);
	
	//결제하기
	int payUpdate(int res);
	
	//진료기록 작성 후
	int diaCodeUpdate(int res);
	

	//후기작성 폼이동
	ReservationVO reviewWrithForm(@Param("r_no") int r_no);

	//페이징 (일반예약조회)
	List<ReservationVO> reservationPageList(Criteria cri);
	
	Integer reservPage(Criteria cri);
	
	int updatecode(ReservationVO vo);

	
	
	
}
