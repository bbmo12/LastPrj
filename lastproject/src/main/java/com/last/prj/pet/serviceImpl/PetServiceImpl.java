package com.last.prj.pet.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.pet.service.PetMapper;
import com.last.prj.pet.service.PetService;
import com.last.prj.pet.service.PetVO;

@Repository("petDAO")
public class PetServiceImpl implements PetService{
	
	@Autowired
	private PetMapper map;
	
	@Override
	public PetVO petOne(int pet_no) {
		// TODO Auto-generated method stub
		return map.petOne(pet_no);
	}

}
