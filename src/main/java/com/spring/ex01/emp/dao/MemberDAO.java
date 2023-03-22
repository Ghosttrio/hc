package com.spring.ex01.emp.dao;

import org.springframework.dao.DataAccessException;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberDAO {
	
	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws DataAccessException;
	
	//회원가입(addMember)
	public void addMember(MemberDTO memberDTO) throws Exception;
	
	//회원 중복확인(checkMember)
	public String checkMember(String id) throws DataAccessException;

}
