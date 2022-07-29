package com.gyull.cookivel.service.member;

import com.gyull.cookivel.domain.member.MemberVO;

public interface MemberService {

	public void register(MemberVO vo);
	
	public MemberVO read(String mem_email);
	
	public MemberVO getAccount(String mem_nickName);
	
	public int accountCount(String mem_nickName);
}
