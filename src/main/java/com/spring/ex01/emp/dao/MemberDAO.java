package com.spring.ex01.emp.dao;

public interface MemberDAO {
	
	public boolean loginDAO(String id, String pwd);
			
	public void addUser(MemberDTO m);
	
	public List<MemberDTO> listUser();
		
	public MemberDTO mypage(String id);
		
	public void update(MemberDTO memberDTO);
		
	public void delete(String id);
		
	public boolean overlappedID(String id);


}
