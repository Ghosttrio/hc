package com.spring.ex01.emp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired	MemberService memberService;
	@Autowired	MemberDTO memberDTO;

	@Override
	public boolean servlog(String id, String pwd) {
		System.out.println("id, pwd 값을 들고 왔는지 확인");
		boolean result = actlogin.loginDAO(id, pwd);
		return false;
	}

	@Override
	public void serSign(MemberDTO m) {
		System.out.println("serSigin이 VO를 다녀왔습니다");
		 actSigin.addUser(m);		
	}

	@Override
	public boolean setCheck(String id) {
		System.out.println("setCheck가 VO를 다녀왔습니다");
		boolean result = setCheck.overlappedID(id);
		return result;
	}

	@Override
	public List<UserDTO> serList() {
		System.out.println("serList가 VO를 다녀왔습니다");
		List<UserDTO>  list = addlist.listUser();
		return list;
	}

	@Override
	public MemberDTO serPage(String id) {
		System.out.println("serPage이 VO를 다녀왔습니다");
		MemberDTO result = actpage.mypage(id);
		
		return result;
	}

	@Override
	public void serUpdate(MemberDTO memberDTO) {
		System.out.println("serUpdate가 VO를 다녀왔습니다");
		actupdate.update(memberDTO);
	}

	@Override
	public void serDel(String id) {
		System.out.println("serDel이 VO를 다녀왔습니다");
		actdel.delete(id);
	}

	

}
