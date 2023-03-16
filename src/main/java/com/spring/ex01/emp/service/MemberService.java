package com.spring.ex01.emp.service;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberService {
	
	//로그인(loginMember)
	public boolean servlog(String id, String pwd);

	//회원가입(addMember)
	public void serSign(MemberDTO m);
	
	//회원 중복확인(checkMember)
	public boolean setCheck(String id);
	
	
	//관리자페이지 회원리스트 (listMember)
	public List<MemberDTO>  serList();
	
	//마이페이지 출력(mainMypage)
	public MemberDTO serPage(String id);
	
	//마이페이지 내 정보 수정(updateMypage)
	public void serUpdate(MemberDTO memberDTO);
	
	//회원탈퇴(delMember)
	public void serDel(String id);

}
