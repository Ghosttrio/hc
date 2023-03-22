package com.spring.ex01.emp.service;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberService {
	
	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws Exception;
	
	//회원가입(addMember)
	public void addMember(MemberDTO m) throws Exception;
	
	//회원 중복확인(checkMember)
	public String  checkMember(String id) throws Exception;

}
