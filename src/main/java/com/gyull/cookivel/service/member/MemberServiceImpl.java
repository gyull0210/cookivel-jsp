package com.gyull.cookivel.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.mapper.member.MemberMapper;
import com.gyull.cookivel.domain.member.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) {
		mapper.register(vo);

	}
	
	@Override
	public MemberVO read(String mem_email) {
		return mapper.read(mem_email);
	}

	@Override	
	public MemberVO getAccount(String mem_nickName) {
		return mapper.getAccount(mem_nickName);
	}

	@Override	
	public int accountCount(String mem_nickName) {
		return mapper.accountCount(mem_nickName);
	}
}
