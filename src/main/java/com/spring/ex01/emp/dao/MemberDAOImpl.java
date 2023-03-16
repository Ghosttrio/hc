package com.spring.ex01.emp.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberDTO login(Map loginMap) throws DataAccessException{
		MemberDTO member=(MemberDTO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}

}
