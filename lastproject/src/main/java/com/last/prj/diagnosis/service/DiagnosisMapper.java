package com.last.prj.diagnosis.service;

import java.util.List;

import com.last.prj.pmember.service.Criteria;

public interface DiagnosisMapper {
	List<DiagnosisVO> diagnosisMemSelect(DiagnosisVO vo); //일반회원 진료기록 조회
	
	
	int diagnosisInsert(DiagnosisVO vo); //진료기록 등록
	
	List<DiagnosisVO> pMemDiaList(Criteria cri); //파트너회원 진료기록 조회
	int pMemDiaTotal(Criteria cri);
	
	List<DiagnosisVO> diaList(); //파트너회원 진료기록 조회
	
}
