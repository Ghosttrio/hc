package com.spring.ex01.emp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.MemberDAO;
import com.spring.ex01.emp.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired	private MemberDAO memberDAO;

	@Override 	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws Exception{
		return memberDAO.loginMember(memberDTO);
	}

	@Override	//회원가입(addMember)
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDAO.addMember(memberDTO);		
	}
	
	@Override	//회원 중복확인(checkMember)
	public String  checkMember(String id) throws Exception {
		return memberDAO.checkMember(id);
	}

	@Override	//마이페이지 출력(mainMypage)
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.mypage(memberDTO);
	}
}
