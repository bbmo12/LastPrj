package com.last.prj.mem.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.mem.service.PmemMapper;
import com.last.prj.mem.service.PmemVO;
import com.last.prj.mem.service.PriceVO;
import com.last.prj.mem.service.PmemService;

@Repository("pmemDao")
public class PmemserviceImpl implements PmemService {

	@Autowired
	private PmemMapper pmap;

	@Override
	public PmemVO pmemberSelect(PmemVO pmember) {
		return pmap.pmemberSelect(pmember);
	}

	@Override
	public String pmemberIdSearch(String name, String tel) {
		return pmap.pmemberIdSearch(name, tel);
	}

	@Override
	public int pmemberInsert1(PmemVO pmember) {
		return pmap.pmemberInsert1(pmember);
	}

	@Override
	public int pmemberInsert2(PmemVO pmember) {
		return pmap.pmemberInsert2(pmember);
	}

	@Override
	public int pmemberInsert3(String p_id, int p_license, int p_image) {
		return pmap.pmemberInsert3(p_id, p_license, p_image);
	}

	@Override
	public boolean isIdCheck(String p_id) {
		return pmap.isIdCheck(p_id);
	}

	@Override
	public List<PriceVO> getPrice(PriceVO price) {
		return pmap.getPrice(price);
	}

}
