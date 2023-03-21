package com.spring.ex01.emp.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ex01.emp.dto.MemberDTO;

public interface MemberDAO {
	
		//로그인(loginMember)
		public MemberDTO loginMember(MemberDTO memberDTO) throws DataAccessException;
		
		//회원가입(addMember)
		public void addMember(MemberDTO memberDTO) throws Exception;
		
		//회원 중복확인(checkMember)
		public String checkMember(String id) throws DataAccessException;
		
		//관리자페이지 회원리스트 (listMember) <보류>
//		public List<MemberDTO>  listMember();
		
		//마이페이지 출력(mainMypage)
//		public MemberDTO mainMypage(String id);
		
		//마이페이지 회원정보 수정(updateMypage)
//		public void updateMypage(MemberDTO memberDTO);
		
		//마이페이지 회원탈퇴(delMember)
//		public void delMember(String id)	throws Exception;

		//마이페이지 영화 예매내역 출력(movieMypage) <보류>
//		public void movieMypage();

		//마이페이지 스토어 구매내역 출력(stroreMypage) <보류>
//		public void stroreMypage();


}
