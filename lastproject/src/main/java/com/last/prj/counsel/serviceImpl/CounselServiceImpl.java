package com.last.prj.counsel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.counsel.service.CounselMapper;
import com.last.prj.counsel.service.CounselService;
import com.last.prj.counsel.service.CounselVO;

@Repository("counselDao")
public class CounselServiceImpl implements CounselService {

	@Autowired CounselMapper map;

	@Override
	public List<CounselVO> myCounselList(String m_id) {
		return map.myCounselList(m_id);
	}

	@Override
	public List<CounselVO> pmemCounselList(String p_id) {
		return map.pmemCounselList(p_id);
	}
	
}
