package com.spring.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("memberDTO")
public class MemberDTO {
	
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_number;
	private String member_phone;
	private String member_birth;
	private String member_gender;
	private String member_grade;
	private String member_agree_mail;
	private String member_expire;
	private String member_no;
	private Date joinDate;
	
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_number=" + member_number + ", member_phone="
				+ member_phone + ", member_birth=" + member_birth + ", member_gender=" + member_gender
				+ ", member_grade=" + member_grade + ", member_agree_mail=" + member_agree_mail + ", member_expire="
				+ member_expire + ", member_no=" + member_no + ", joinDate=" + joinDate + "]";
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_number() {
		return member_number;
	}
	public void setMember_number(String member_number) {
		this.member_number = member_number;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_agree_mail() {
		return member_agree_mail;
	}
	public void setMember_agree_mail(String member_agree_mail) {
		this.member_agree_mail = member_agree_mail;
	}
	public String getMember_expire() {
		return member_expire;
	}
	public void setMember_expire(String member_expire) {
		this.member_expire = member_expire;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
