package com.last.prj.diagnosis.service;

import java.util.List;

public interface DiagnosisMapper {
	List<DiagnosisVO> diagnosisMemSelect(DiagnosisVO vo); //일반회원 진료기록 조회
	
	List<DiagnosisVO> diagnosisPmemSelect(DiagnosisVO vo); //파트너회원 진료기록 조회
	
	int diagnosisInsert(DiagnosisVO vo); //진료기록 등록
}
