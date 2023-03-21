package com.spring.ex01.emp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.MemberDAO;
import com.spring.ex01.emp.dto.MemberDTO;

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

//	@Override	//관리자페이지 회원리스트 (listMember) <보류>
//	public List<MemberDTO> listMember() {
//		List<MemberDTO>  list = listMember.listUser();
//		return list;
//	}

//	@Override	//마이페이지 출력(mainMypage)
//	public MemberDTO mainMypage(String id) {
//		MemberDTO result = mainMypage.mypage(id);
//		
//		return result;
//	}

//	@Override	//마이페이지 회원정보 수정(updateMypage)
//	public void updateMypage(MemberDTO memberDTO) {
//		memberService.updateMypage(memberDTO);
//	}

//	@Override	//마이페이지 회원탈퇴(delMember)
//	public void delMember(String id) throws Exception {
//		memberDAO.delMember(id);
//	}
	
//	@Override	//마이페이지 영화 예매내역 출력(movieMypage) <보류>
//	public void movieMypage();
	
//	@Override	//마이페이지 스토어 구매내역 출력(stroreMypage) <보류>
//	public void stroreMypage();
	

}
