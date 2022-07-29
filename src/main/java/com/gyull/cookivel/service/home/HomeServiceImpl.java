package com.gyull.cookivel.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.cookivel.domain.member.MemberVO;
import com.gyull.cookivel.mapper.home.HomeMapper;

import lombok.Setter;

@Service
public class HomeServiceImpl implements HomeService {

	@Setter(onMethod_ = {@Autowired})
	HomeMapper mapper;
	
	@Override
	public void create(MemberVO vo) {
		mapper.create(vo);
	}
	
	@Override
	public List<MemberVO> list() {
		return mapper.list();
	}
	
	@Override
	public MemberVO getMember(int member_idx) {
		return mapper.getMember(member_idx);
	}

}
