package com.last.prj.reserv.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pmember.service.Criteria;
import com.last.prj.reserv.service.ReservationMapper;
import com.last.prj.reserv.service.ReservationService;
import com.last.prj.reserv.service.ReservationVO;

@Repository("reservationDao")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
		private ReservationMapper map;
	@Override
	public List<ReservationVO> reservationSelect(ReservationVO vo) {
		return map.reservationSelect(vo);
	}
	@Override
	public List<ReservationVO> reservationSelectList() {
		return map.reservationSelectList();
	}
	@Override
	public int okUpdate(int res) {
		return map.okUpdate(res);
	}
	@Override
	public int noUpdate(int rno, String refuse) {
		return map.noUpdate(rno, refuse);
	}
	@Override
	public int payUpdate(int res) {
		
		return map.payUpdate(res);
	}
	@Override
	public int reservInsert(ReservationVO vo) {
		return map.reservInsert(vo);
	}
	@Override
	public int diaCodeUpdate(int res) {
		return map.diaCodeUpdate(res);
	}
	@Override

	public ReservationVO reviewWrithForm(int r_no) {
		return map.reviewWrithForm(r_no);
	}


	public int reservPage(Criteria cri) {
		return map.reservPage(cri);
	}
	@Override
	public List<ReservationVO> reservationPageList(Criteria cri) {
		return map.reservationPageList(cri);
	}
	@Override
	public List<ReservationVO> preservationPageList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int preservPage(Criteria cri) {
		return 0;
	}
	@Override
	public int updatecode(ReservationVO vo) {

		return map.updatecode(vo);
	}
	@Override

	public List<ReservationVO> reservationSelect(String m_id) {
		return map.reservationSelect(m_id);

	public ReservationVO rnoreview(int r_no) {
		return map.rnoreview(r_no);

	}


}
