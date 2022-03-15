package com.last.prj.pet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pet.service.PetMapper;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;
import com.last.prj.service.service.ServiceVO;

@Repository("petDAO")
public class PetServiceImpl implements PetService{
	
	@Autowired
	private PetMapper map;
	
	@Override
	public PetVO petOne(int pet_no) {
		// TODO Auto-generated method stub
		return map.petOne(pet_no);
	}

	@Override
	public List<PetVO> petmemberList(String m_id) { //반려동물 펫 리스트 출력
		return map.petmemberList(m_id);
	}

	@Override
	public PetVO petSearch(int pet_no) {
		return map.petSearch(pet_no);
	}

	@Override
	public int mypetInsert(PetVO pet) {
		return map.mypetInsert(pet);
	}

	@Override
	public List<PetVO> petCodeSearch(String m_id) {
		return map.petCodeSearch(m_id);
	}

	@Override
	public int petCount() {
		return map.petCount();
	}

	@Override
	public int mypetupdate(PetVO pet) {
		return map.mypetupdate(pet);
	}

	@Override
	public int mypetDelete(int pet_no) {
		return map.mypetDelete(pet_no);
	}

	@Override
	public int AutoCode(int pet_no) {
		return map.AutoCode(pet_no);
	}



}
