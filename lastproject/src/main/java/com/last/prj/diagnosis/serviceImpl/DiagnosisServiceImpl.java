package com.last.prj.diagnosis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.diagnosis.service.DiagnosisMapper;
import com.last.prj.diagnosis.service.DiagnosisService;
import com.last.prj.diagnosis.service.DiagnosisVO;
import com.last.prj.pmember.service.Criteria;

@Repository("diaDao")
public class DiagnosisServiceImpl implements DiagnosisService {
	
	@Autowired
	private DiagnosisMapper map;

	@Override
	public List<DiagnosisVO> diagnosisMemSelect(DiagnosisVO vo) {
		return map.diagnosisMemSelect(vo);
	}

	@Override
	public int diagnosisInsert(DiagnosisVO vo) {
		return map.diagnosisInsert(vo);
	}

	@Override
	public List<DiagnosisVO> pMemDiaList(Criteria cri) {
		return map.pMemDiaList(cri);
	}

	@Override
	public int pMemDiaTotal(Criteria cri) {
		return map.pMemDiaTotal(cri);
	}


	@Override
	public List<DiagnosisVO> diaList() {
		return map.diaList();
	}

}
