package com.spring.ex01.emp.dao;

public interface MemberDAO {
	
	public MemberDTO login(Map loginMap) throws DataAccessException;

}
