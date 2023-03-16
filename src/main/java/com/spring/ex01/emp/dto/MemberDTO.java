package com.spring.ex01.emp.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberDTO {
	
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_number;
	private Date joinDate;

	private String member_birth_y;
	private String member_birth_m;
	private String member_birth_d;
	private String member_gender;
	
	public MemberDTO() {
		System.out.println("MemberDTO 실행");
	}
	
//	public MemberDTO(String id, String pwd) {
//		super();
//		this.member_id = member_id;
//		this.member_pwd = member_pwd;
//	}
//	
//	public MemberDTO(String id, String pwd, String name, String member_email) {
//		super();
//		this.member_id = member_id;
//		this.member_pwd = member_pwd;
//		this.member_name = member_name;
//		this.member_email = member_email;
//	}
//	public MemberDTO(String id, String pwd, String name, String member_email, Date joinDate) {
//		super();
//		this.member_id = member_id;
//		this.member_pwd = member_pwd;
//		this.member_name = member_name;
//		this.member_email = member_email;
//		this.joinDate = joinDate;
//	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pwd;
	}
	public void setMember_pw(String member_pw) {
		this.member_pwd = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getEmail() {
		return member_email;
	}
	public void setEmail(String member_email) {
		this.member_email = member_email;
	}
	public String getNumber() {
		return member_number;
	}
	public void setNumber(String member_number) {
		this.member_number = member_number;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getMember_birth_y() {
		return member_birth_y;
	}
	public void setMember_birth_y(String member_birth_y) {
		this.member_birth_y = member_birth_y;
	}
	public String getMember_birth_m() {
		return member_birth_m;
	}
	public void setMember_birth_m(String member_birth_m) {
		this.member_birth_m = member_birth_m;
	}
	public String getMember_birth_d() {
		return member_birth_d;
	}
	public void setMember_birth_d(String member_birth_d) {
		this.member_birth_d = member_birth_d;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	
	
}
