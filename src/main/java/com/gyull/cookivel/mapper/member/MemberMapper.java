package com.gyull.cookivel.mapper.member;

import org.apache.ibatis.annotations.Mapper;

import com.gyull.cookivel.domain.member.MemberVO;

@Mapper
public interface MemberMapper {

	public void register(MemberVO vo);
	
	public MemberVO read(String mem_email);
	
	public MemberVO getAccount(String mem_nickName);
	
	public int accountCount(String mem_nickName);
//	public int emailCheck(String mem_email);
//	
//	public int accountCheck(MemberVO vo);
//	
//	public int nickCheck(String mem_nickName);
//	
//	public int phoneCheck(String mem_phoneNum);
}
