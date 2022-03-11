package com.last.prj.counsel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.counsel.service.CounselMapper;
import com.last.prj.counsel.service.CounselService;
import com.last.prj.counsel.service.CounselVO;
import com.last.prj.pmember.service.Criteria;

@Repository("counselDao")
public class CounselServiceImpl implements CounselService {

	@Autowired CounselMapper map;


	@Override
	public List<CounselVO> myCounselList(String m_id) {
		return map.myCounselList(m_id);
	}
	
	@Override
	public List<CounselVO> counselList(Criteria cri) {
		return map.counselList(cri);
	}

	@Override
	public int counselPage(Criteria cri) {
		return map.counselPage(cri);
	}

	@Override
	public int myCounselPage(Criteria cri) {
		return map.myCounselPage(cri);
	}
	
	@Override
	public List<CounselVO> myCounselList(Criteria cri) {
		return map.myCounselList(cri);
	}

	@Override
	public List<CounselVO> csDetail(int c_no) {
		// TODO Auto-generated method stub
		return map.csDetail(c_no);
	}

	@Override
	public int newCs(CounselVO cs) {
		// TODO Auto-generated method stub
		return map.newCs(cs);
	}

	@Override
	public int newCsAns(CounselVO cs) {
		// TODO Auto-generated method stub
		return map.newCsAns(cs);
	}

	@Override
	public int CodeUdt(int c_no) {
		// TODO Auto-generated method stub
		return map.CodeUdt(c_no);
	}

	@Override
	public Integer isExist(String m_id, String p_id) {
		// TODO Auto-generated method stub
		return map.isExist(m_id, p_id);
	}

	@Override
	public CounselVO oneCs(int c_no) {
		// TODO Auto-generated method stub
		return map.oneCs(c_no);
	}

	@Override
	public List<CounselVO> pmemCounselList(Criteria cri) {
		// TODO Auto-generated method stub
		return map.pmemCounselList(cri);
	}

	@Override
	public int codeUpd(int p_no) {
		// TODO Auto-generated method stub
		return map.codeUpd(p_no);
	}	
}
