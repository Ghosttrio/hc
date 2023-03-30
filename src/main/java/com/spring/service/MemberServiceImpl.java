package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired	private MemberDAO memberDAO;

	@Override 	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws Exception{
		return memberDAO.loginMember(memberDTO);
	}

	@Override	//회원가입(addMember)
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDAO.addMember(memberDTO);		
	}
	
	@Override	//회원 중복확인(checkMember)
	public String  checkMember(String id) throws Exception {
		return memberDAO.checkMember(id);
	}

	@Override	//마이페이지 출력(mainMypage)
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.mypage(memberDTO);
	}
	
	@Override	//마이페이지 회원정보 수정(updateMypage)
	public int updateMypage(MemberDTO memberDTO)  throws Exception {
		System.out.println("updateMypage 서비스:"+memberDTO);
		return memberDAO.updateMypage(memberDTO);
	}

	@Override	//마이페이지 회원탈퇴(delMember)
	public void delMember(String id) throws Exception {
		memberDAO.delMember(id);
	}
}
