package com.spring.dao;

import org.springframework.dao.DataAccessException;

import com.spring.dto.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO loginMember(MemberDTO memberDTO) throws DataAccessException;
	public void addMember(MemberDTO memberDTO) throws Exception;
	public String checkMember(String id) throws DataAccessException;
	public MemberDTO mypage(MemberDTO memberDTO) throws DataAccessException;
	public int updateMypage(MemberDTO memberDTO) throws DataAccessException;
	public void delMember(String id)	throws Exception;
	
}
