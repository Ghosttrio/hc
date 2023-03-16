package com.spring.ex01.emp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception{
		memberDAO.insertNewMember(memberDTO);
	}

}
