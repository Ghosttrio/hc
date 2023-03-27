package com.spring.ex01.emp.service;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberService {
	
	public MemberDTO loginMember(MemberDTO memberDTO) throws Exception;
	public void addMember(MemberDTO m) throws Exception;
	public String  checkMember(String id) throws Exception;
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception;
	public int updateMypage(MemberDTO memberDTO)  throws Exception;
	public void delMember(String id)	throws Exception;

}
