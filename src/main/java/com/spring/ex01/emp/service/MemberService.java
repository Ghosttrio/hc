package com.spring.ex01.emp.service;

public interface MemberService {
	
	public MemberDTO login(Map  loginMap) throws Exception;
	public void addMember(MemberDTO memberDTO) throws Exception;

}
