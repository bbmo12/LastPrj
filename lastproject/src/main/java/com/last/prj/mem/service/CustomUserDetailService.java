package com.last.prj.mem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;


public class CustomUserDetailService implements UserDetailsService{
	
	@Setter(onMethod_= {@Autowired})
	private MemMapper memMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("====유저디테일 username===" + username);
		
		MemVO mem = memMapper.read(username);
		System.out.println("===유저디테일 mem===" + mem);
		
		return null;
	}

}
