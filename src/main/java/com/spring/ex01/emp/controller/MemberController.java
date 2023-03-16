package com.spring.ex01.emp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex01.emp.dto.MemberDTO;
import com.spring.ex01.emp.service.MemberService;

@Controller("memberController")
@RequestMapping("/Member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberDTO memberDTO;
	
	//로그인
	@RequestMapping(value="/loginMember",method = RequestMethod.POST)
	public String loginMember(@ModelAttribute MemberDTO memberDTO,
					            HttpServletRequest req, HttpServletResponse resp) {

		HttpSession session = req.getSession();
		System.out.println("session:" +session.getAttribute("member_id"));
		String member_id = req.getParameter("member_id");
		String pwd = req.getParameter("pwd");
		System.out.println(member_id + pwd);
		
		boolean result = servlog.servlog(member_id, member_pwd);
		System.out.println("return되어 최종 돌려받은 값:"+result);
		System.out.println(member_id+pwd);
		
		if( result ) {
			session.setAttribute("member_id",member_id);
			System.out.println("session 로그인:"+session);
			
			return "";	
	
		} else {
			System.out.println("로그인 실패");
			return "";
		}
	}
	//회원가입
	@RequestMapping(value="/addMember",method = RequestMethod.POST)
	public String addMember(Model model,
					            HttpServletRequest req, HttpServletResponse resp) {
		
		String member_member_id = req.getParameter("member_member_id");
		String member_pwd1 = req.getParameter("member_pwd1");
		String member_pwd2 = req.getParameter("member_pwd2");
		String member_name = req.getParameter("member_name");
		String member_email = req.getParameter("member_email");
		System.out.println(member_member_id+"/"+member_pwd1+"/"+member_name+"/"+member_email);
		
			if(member_pwd1.equals(member_pwd2)) {
				memberDTO.setMember_id(member_member_id);
				memberDTO.setMember_pwd1(member_pwd1);
				memberDTO.setMember_name(member_name);
				memberDTO.setMember_email(member_email);
				actSign.serSign(memberDTO);
				
				return "member/";

			} else {
				return "";
				
			}
	}

	//회원 중복확인
	@RequestMapping(value="/checkMember",method = RequestMethod.POST)
	public String checkMember (Model model,
								HttpServletRequest req,HttpServletResponse resp) {

		String member_id = (String) req.getParameter("member_member_id");
		System.out.println("member_id = " + member_id);
		boolean overlappedID = nameCheck.setCheck(member_id);
		
		//회원 중복확인에 대한 결과 메시지 전송
		PrintWriter writer = resp.getWriter();
			if (overlappedID == true) {
				writer.print("not_usable");
			} else {
				writer.print("usable");
			}
			
	//회원리스트 생성
	@RequestMapping(value="/listMember",method = RequestMethod.POST)		
	public String listMember (Model model,
			HttpServletRequest req,HttpServletResponse resp) {
		
		MemberService actList = new MemberService();
		List<MemberDTO> UserList = actList.serList();//회원정보 조회할 때 사용할 수 있음
		req.setAttribute("UserList", UserList);//조회한 정보를 req에 바인딩
		
	}

		
	//마이페이지 내 정보 출력
	@RequestMapping(value="/mainMypage",method = RequestMethod.POST)	
	public String mainMypage (Model model,
			HttpServletRequest req,HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		String member_id = (String)session.getAttribute("member_id");
		System.out.println("session member_id값:" +member_id);
		
			if(member_id!=null) {
				MemberService mypage = new MemberService();
				MemberDTO result = mypage.serPage(member_id);
				req.setAttribute("result", result);
				System.out.println(result);					
				
			} else {
				System.out.println("session member_id값이 없습니다.");
			}
	}
	
	//마이페이지 내 정보 수정
	@RequestMapping(value="/updateMypage",method = RequestMethod.POST)	
	public String updateMypage (Model model,
			HttpServletRequest req,HttpServletResponse resp) {
		
		System.out.println("회원정보수정 출력");
	
		MemberService actupdate = new MemberService();
		String member_id = req.getParameter("member_id");
		String pwd1 = req.getParameter("pwd1");
		String pwd2 = req.getParameter("pwd2");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		System.out.println("update getParam:"+member_id+"/"+pwd1+"/"+"/"+name+"/"+email);
		
		if(pwd1.equals(pwd2)) {
			MemberDTO vo = new MemberDTO();
			vo.setId(member_id);
			vo.setPwd(pwd1);
			vo.setName(name);
			vo.setEmail(email);
			actupdate.serUpdate(vo);
			
			}
	}
	
	//마이페이지 영화 예매내역 출력
	//마이페이지 스토어 구매내역 출력
	
			
	//회원탈퇴
	@RequestMapping(value="/delMember",method = RequestMethod.POST)	
	public String delMember (Model model,
			HttpServletRequest req,HttpServletResponse resp) {
		
			String member_id = req.getParameter("member_id");
			String pwd = req.getParameter("pwd");
			if(pwd!=null) {
				MemberService actdel = new MemberService();
				actdel.serDel(member_id);
				
			}
	}
	
	
}
