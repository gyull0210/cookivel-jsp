package com.gyull.cookivel.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.gyull.cookivel.domain.member.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private MemberVO member;
	
	public CustomUser(String mem_email, String mem_pw, Collection<? extends GrantedAuthority> authorities) {
		super(mem_email, mem_pw, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getMem_email(), vo.getMem_pw(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getMem_codeName())).collect(Collectors.toList()));
		this.member = vo;
	}
}
