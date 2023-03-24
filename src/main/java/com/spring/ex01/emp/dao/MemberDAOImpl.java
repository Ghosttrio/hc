package com.spring.ex01.emp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired	private SqlSession sqlSession;	

	@Override	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws DataAccessException {
			System.out.println("loginMember: "+memberDTO);
			MemberDTO member = (MemberDTO) sqlSession.selectOne("mapper.member.loginMember",memberDTO);
			System.out.println("MemberDAOImpl, loginMember: "+member);
			return member;
		}

	@Override	//회원가입(addMember)
	public void addMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("mapper.member.addMember",memberDTO) ;
	}
	
	@Override 	//회원 중복확인(checkMember)
	public String  checkMember(String id) throws DataAccessException{
		System.out.println("checkmember Id: "+id);
		String result =  sqlSession.selectOne("mapper.member.checkMember",id);
		return result;
	}	
	
	@Override	//마이페이지 출력(mypage)
	public MemberDTO mypage(MemberDTO memberDTO) throws DataAccessException{
		System.out.println("mypage: "+memberDTO);
		MemberDTO member = (MemberDTO) sqlSession.selectOne("mapper.member.mainMypage",memberDTO);
		System.out.println("MemberDAOImpl, mypage: "+member);
		return member;
	}
	
	

}
