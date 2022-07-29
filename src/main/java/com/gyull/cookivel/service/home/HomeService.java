package com.gyull.cookivel.service.home;

import com.gyull.cookivel.domain.member.MemberVO;
import java.util.List;

public interface HomeService {
	
	public void create(MemberVO vo);
	
	public List<MemberVO> list();
	
	public MemberVO getMember(int member_idx);
}
