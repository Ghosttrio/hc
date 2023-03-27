package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.ManagerDAO;

@Service
public class ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	public List selectMember() {
		List memberList = managerDAO.selectMember();
		return memberList;
	}
}
