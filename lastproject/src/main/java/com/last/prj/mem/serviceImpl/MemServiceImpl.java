package com.last.prj.mem.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.mem.service.LoginVO;
import com.last.prj.mem.service.MemMapper;
import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PetcareVO;
import com.last.prj.mem.service.PriceVO;
import com.last.prj.mem.service.TimeVO;
import com.last.prj.pmember.service.PmemberVO;


@Repository("memDao")
public class MemServiceImpl implements MemService {

	@Autowired
	private MemMapper map;
	
	//일반회원 로그인
	@Override
	public MemVO memberSelect(MemVO member) {
		return map.memberSelect(member);
	}
	
	//일반회원 아이디 찾기
	@Override
	public String memberIdSearch(String name, String tel) {
		return map.memberIdSearch(name, tel);
	}
		//일반회원 회원가입
	@Override
	public int memberInsert(MemVO member) {
		return map.memberInsert(member);
	}

	//아이디로 일반회원 조회
	@Override
	public MemVO memberOne(String m_id) {
		return map.memberOne(m_id);
	}
	//회원 조회
	@Override
	public MemVO memberSearch(String m_id) {
		return map.memberSearch(m_id);
	}

	@Override
	public int memberUpdate(MemVO member) {
		return map.memberUpdate(member);
	}

	@Override
	public int memberDelete(String m_id) {
		return map.memberDelete(m_id);
	}

	@Override
	public boolean idCheck(String m_id) {
		return map.idCheck(m_id);
	}

	@Override
	public boolean isIdCheck(String m_id) {

		return map.isIdCheck(m_id);
	}

	@Override
	public int memCount() {
		return map.memCount();
	}

	@Override
	public int servicepriceinsert(PriceVO price) {
		return map.servicepriceinsert(price);
	}

	@Override
	public int petcareinsert(PetcareVO petcare) {
		// TODO Auto-generated method stub
		return map.petcareinsert(petcare);
	}

	@Override
	public int otimeinsert(TimeVO time) {
		return map.otimeinsert(time);
	}

	@Override
	public MemVO read(String username) {
		return map.read(username);
	}

	@Override

	public LoginVO searchPwd(String id) {
		return map.searchPwd(id);
	}

	@Override
	public int memberPwdUpdate(MemVO mem) {
		return map.memberPwdUpdate(mem);
	}


	public int memdelete() {
		return map.memdelete();
	}

	@Override
	public List<MemVO> admMlistCode(MemVO vo) {
		return map.admMlistCode(vo);
	}

	@Override
	public int adMmemCount() {
		return map.adMmemCount();
	}

	@Override

	public List<MemVO> admMemChart() {
		return map.admMemChart();
	}

	@Override
	public List<MemVO> admMemReporCode(MemVO vo) {
		return map.admMemReporCode(vo);
	}

	@Override
	public int admMemReportCount() {
		return map.admMemReportCount();
    
	public MemVO getmemberinfo(String m_id) {
		return map.getmemberinfo(m_id);
	}

	@Override
	public String passCheck(String m_id) {
		return map.passCheck(m_id);

	}



}
