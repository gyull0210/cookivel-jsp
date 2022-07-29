package com.gyull.cookivel.mapper.home;

import com.gyull.cookivel.domain.member.MemberVO;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeMapper {
	
	public void create(MemberVO vo);
	
	public List<MemberVO> list();
	
	public MemberVO getMember(int member_idx);
}
