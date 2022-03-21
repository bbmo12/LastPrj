package com.last.prj.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.last.prj.mem.service.MemMapper;
import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PmemMapper;
import com.last.prj.mem.service.PmemVO;

import lombok.Setter;


public class CustomUserDetailService implements UserDetailsService{
	
	@Setter(onMethod_= {@Autowired})
	private MemMapper memMapper;
	
	@Setter(onMethod_= {@Autowired})
	private PmemMapper pmemMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("====유저디테일 username===" + username);
		
		MemVO mem = memMapper.read(username);
		PmemVO pmem = pmemMapper.read(username);
		
		if(mem != null) {
			System.out.println("===유저디테일 mem===" + mem);
			return new CustomUser(mem);
			
		}else if(pmem != null){
			System.out.println("===유저디테일 pmem===" + pmem);
			return new CustomUser(pmem);
			
		}else {
			throw new UsernameNotFoundException("no user");
		}
		
	}

}