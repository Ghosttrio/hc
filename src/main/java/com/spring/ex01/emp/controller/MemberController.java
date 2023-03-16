package com.spring.ex01.emp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//회원가입
	@RequestMapping(value="/new",method = RequestMethod.POST)
	public String addMember(Model model,
					            HttpServletRequest req, HttpServletResponse resp) {
		
		String member_member_id = req.getParameter("member_member_id");
		String member_pwd1 = req.getParameter("member_pwd1");
		String member_pwd2 = req.getParameter("member_pwd2");
		String member_name = req.getParameter("member_name");
		String member_email = req.getParameter("member_email");
		System.out.println(member_member_id+"/"+member_pwd1+"/"+member_name+"/"+member_email);
		
			if(member_pwd1.equals(member_pwd2)) {
				MemberService actSign = new MemberService();
				MemberDTO memberDTO = new MemberDTO();
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
	public String checkMember (Model model,
								HttpServletRequest req,HttpServletResponse resp) {

		String member_id = (String) req.getParameter("member_member_id");
		System.out.println("member_id = " + member_id);
		MemberService nameCheck = new MemberService();
		boolean overlappedID = nameCheck.setCheck(member_id);
		
		//회원 중복확인에 대한 결과 메시지 전송
		PrintWriter writer = response.getWriter();
			if (overlappedID == true) {
				writer.print("not_usable");
			} else {
				writer.print("usable");
			}
			
	//회원리스트 생성
	} else if (action.equals("/userlist")) {
		MemberService actList = new MemberService();
		List<MemberDTO> UserList = actList.serList();//회원정보 조회할 때 사용할 수 있음
		request.setAttribute("UserList", UserList);//조회한 정보를 request에 바인딩
		System.out.println("회원리스트 생성 출력");
//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
		page ="/hyojung/LogIn.jsp";
		
	//로그인
	}else if (action.equals("/login")) {
			HttpSession session = request.getSession();
			System.out.println("session:" +session.getAttribute("member_id"));
			String member_id = request.getParameter("member_id");
			String pwd = request.getParameter("pwd");
			System.out.println(member_id + pwd);
			
			MemberService servlog = new MemberService();
			boolean result = servlog.servlog(member_id, pwd);
			System.out.println("return되어 최종 돌려받은 값:"+result);
			System.out.println(member_id+pwd);
			
			if( result ) {
					session.setAttribute("member_id",member_id);
//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
					//창순씨 메인페이지 주소로 이동해야함.
					page = "/HumanCinema/movie1/main.do";
					//
					System.out.println("session:"+session);

			} else {
//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
				page = "/hyojung/LogIn.jsp";
				System.out.println("로그인 실패");
			}
			System.out.println("로그인 출력");
		
	//마이페이지 내 정보 출력
	} else if (action.equals("/mypage")){
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		System.out.println("session member_id값:" +member_id);
				if(member_id!=null) {
					MemberService mypage = new MemberService();
					MemberDTO result = mypage.serPage(member_id);
					request.setAttribute("result", result);
					System.out.println(result);					
					
					page="/hyojung/Mypage.jsp";
				} else {
					System.out.println("session member_id값이 없습니다.");
					page="/hyojung/LogIn.jsp";
				}
	
	//마이페이지 내 정보 수정
	} else if (action.equals("/update")) {
		System.out.println("회원정보수정 출력");
	
		MemberService actupdate = new MemberService();
		String member_id = request.getParameter("member_id");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("update getParam:"+member_id+"/"+pwd1+"/"+"/"+name+"/"+email);
		
		if(pwd1.equals(pwd2)) {
			MemberDTO vo = new MemberDTO();
			vo.setId(member_id);
			vo.setPwd(pwd1);
			vo.setName(name);
			vo.setEmail(email);
			actupdate.serUpdate(vo);
			page="/hyojung/Mypage.jsp";
			}
			
	//회원탈퇴
	}else if(action.equals("/delete")){
			String member_id = request.getParameter("member_id");
			String pwd = request.getParameter("pwd");
			if(pwd!=null) {
				MemberService actdel = new MemberService();
				actdel.serDel(member_id);
				
				page="/HumanCinema/movie1/main.do";
			}
	}
	
	if(!action.equals("/check")) {
		RequestDispatcher dispatch = request.getRequestDispatcher(page);
		dispatch.forward(request, response);
	}	
	
	
	
	
	
	
	
	
	
	

	//로그인
	//로그아웃
	//회원가입
	//마이페이지
	//관리자페이지(회원정보)
	
}
