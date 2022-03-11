package com.last.prj.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.last.prj.mem.service.MemVO;
import com.last.prj.mem.service.PmemVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	private MemVO member;
	private PmemVO pmember;
	private String role;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	public CustomUser(MemVO mem) {
		super(mem.getM_id(), mem.getPassword(),
				mem.getAuthList().stream().map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.member = mem;
		this.role = "일반회원";
	}
	
	public CustomUser(PmemVO pmem) {
		super(pmem.getP_id(), pmem.getPassword(),
				pmem.getAuthList().stream().map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.pmember = pmem;
		this.role = "파트너회원";
	}
}
