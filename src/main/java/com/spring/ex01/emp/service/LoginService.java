package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.LoginDAO;
import com.spring.ex01.emp.dto.LoginDTO;

@Service("loginService")
public class LoginService {
	
	@Autowired
	private LoginDAO loginDAO;
	
	public void memberInsert(LoginDTO loginDTO) {
		loginDAO.memberInsert(loginDTO);
	}
	
	public List memberList(LoginDTO loginDTO) {
		List memberList = loginDAO.memberList(loginDTO);
		return memberList;
	}
	
	
	
	
}
