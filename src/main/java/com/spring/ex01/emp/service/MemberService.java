package com.spring.ex01.emp.service;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberService {
	
	public void serSign(MemberDTO memberDTO);
	public void addMember(MemberDTO memberDTO) throws Exception;

}
