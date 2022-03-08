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
	public List<CounselVO> myCounselList(String m_id) {
		return null;
	}

	@Override
	public List<CounselVO> pmemCounselList(String p_id) {
		return null;
	}
	
}
