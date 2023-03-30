package com.spring.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.MemberDTO;
import com.spring.service.MemberService;
import com.spring.service.MovieServiceImpl;

@Controller("memberController")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	private MemberService memberService;
	
	@Autowired	private MovieServiceImpl movieService;
	
	//로그인 View (/login.do) 
	@RequestMapping("/login.do")
	public String login() {
		return "member/Login";
	}
	
	//로그인(loginMember)
	@RequestMapping(value="/loginMember", method = {RequestMethod.POST, RequestMethod.GET})
	public String  loginMember(@ModelAttribute  MemberDTO memberDTO ,	Model model
														,HttpServletRequest req, HttpServletResponse resp	) throws Exception {

			System.out.println("check loginMember 로그인 실행");//로그인 접속여부 출력
			
			memberDTO = memberService.loginMember(memberDTO);
		
			if(memberDTO != null) {
			  HttpSession session = req.getSession();
			  
			  session.setAttribute("member", memberDTO);
			  session.setAttribute("isLogOn", true); // 세션 속성(true 로그인/ false 로그아웃)
			  System.out.println("login session: "+session.getAttribute("isLogOn")+"(true 있음 false 없음)"); //세션정보 출력
			  List movieList = movieService.movieList();
				
			  model.addAttribute("movieList",movieList);
			  session.setAttribute("memberList", memberDTO);
			  return "main/main";
				
			}else {
				  model.addAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
				  model.addAttribute("result","loginFailed");
				  
				  return "member/Login";
			}	
	}
	
	//회원가입 View (/add.do) 
	@RequestMapping("/signup.do")
	public String add() {
		return "member/Signup";
	}
	
	//회원가입(addMember)
	@RequestMapping(value="/addMember", method = {RequestMethod.POST, RequestMethod.GET})
	public String addMember(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model
														,HttpServletRequest req, HttpServletResponse resp) throws Exception {
			System.out.println("check addMember 회원가입 실행");
			System.out.println("입력 받은 id 값: "+memberDTO.getMember_id());
					
					try {
					    memberService.addMember(memberDTO);	//회원정보를 SQL문에 전달
					    model.addAttribute("result","signupSucceed"); //request처럼 redirect를 하면 사라진다.
					    model.addAttribute("msg", "가입을 환영합니다.");
					    System.out.println("/addMember Succeed 회원가입 성공");
					    
					}catch(Exception e) {
						System.out.println("/addMember failed 회원가입 실패");
						return "addMember";
					}
					
					return "forward:/login.do";
				}
	
	
	//회원 중복확인(checkMember)
	@RequestMapping(value="/checkMember", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody  String checkMember (@RequestParam("member_id") String member_id) throws Exception {
			System.out.println("check checkMember 중복체크 실행");
			
			String result = memberService.checkMember(member_id);
			
			System.out.println("중복확인 하는 아이디 값: "+ member_id); //가져온 아이디 출력
			System.out.println("/checkMember 의 결과 값이  : "+result+" (false=가능/true:불가능)"); 
			
			return result;
	}
	
	//로그아웃(logout)
	  @RequestMapping(value="/logout.do", method={RequestMethod.POST, RequestMethod.GET})
	  public String logout(HttpServletRequest req,	 HttpServletResponse resp) throws Exception {
			  System.out.println("check logout 로그아웃 실행"); 
	
			  HttpSession session = req.getSession();	//세션정보를 불러오고
				System.out.println("logout session: "+session);	//세션 정보 출력
				
				session.invalidate();	//로그인 된 회원정보를 삭제한다.
				
				return "redirect:/login.do";
	  }
	  
	  //마이페이지 메인 페이지 출력(mypage.do)
		@RequestMapping(value="/mypage.do", method={RequestMethod.POST, RequestMethod.GET})	
		public String mainMypage (Model model, HttpServletRequest req,	HttpServletResponse resp	) throws Exception {
				System.out.println("check mainMypage 마이 페이지 실행"); 
			
				 HttpSession session = req.getSession();
	
				 if( (boolean)session.getAttribute("isLogOn")==true ) {
					 System.out.println("로그인 세션출력 isLogOn(true : "+session.getAttribute("isLogOn"));
					 
					 MemberDTO memberDTO = new MemberDTO();
					 memberDTO = (MemberDTO)session.getAttribute("member");
					 memberDTO = memberService.mypage(memberDTO);
					 
					 model.addAttribute("result", memberDTO);
					 
					 return "member/Mypage_main";
				}else {
					System.out.println("로그인 정보가 없어 마이페이지를 출력 할 수 없습니다"); //실패 출력
					return "member/Login";
				}
		}
		
		//회원 정보 수정 View (/update.do) 
		@RequestMapping("/update.do")
		public String update() {
			return "updateMypage";
		}		

		//마이페이지 회원 정보 수정(updateMypage)
		@RequestMapping(value="/updateMypage", method={RequestMethod.POST, RequestMethod.GET})	
		public String updateMypage (@ModelAttribute("memberDTO") MemberDTO memberDTO
																,@RequestParam("inputPwd1") String inputPwd1
																,@RequestParam("inputPwd2") String inputPwd2
																,HttpSession session, Model model) throws Exception {
			
				System.out.println("check updateMypage 회원 정보 수정 페이지 실행"); 
		
				MemberDTO updateDTO = (MemberDTO)session.getAttribute("member");
				System.out.println("세션에 있는 :"+updateDTO);
				System.out.println("전달받은 있는 :"+memberDTO);
				String member_pwd = updateDTO.getMember_pwd();
				System.out.println("세션의 비밀번호 member_pwd: "+member_pwd);
				System.out.println("입력한 비밀번호 inputPwd:"+inputPwd1+"/"+inputPwd2);

				if( (boolean)session.getAttribute("isLogOn")==true ) {
					 System.out.println("로그인 세션출력 isLogOn(true : "+session.getAttribute("isLogOn"));
							if( member_pwd.equals(memberDTO.getMember_pwd()) && inputPwd1.equals(inputPwd2)){
								System.out.println("if의 if문 실행");
								
								memberService.updateMypage(memberDTO);
								System.out.println("memberDTO:"+memberDTO);
								
								model.addAttribute("msg", "회원정보가 수정 되었습니다.");
								
								//수정된 회원 정보를 다시 세션에 저장한다.(*중요한 작업)
								session.setAttribute("member", memberDTO);
			
										return "updateMypage";
									
							}else {
									System.out.println("비밀번호가 일치하지 않습니다");
								    model.addAttribute("msg", "비밀번호가 일치하지 않아 /n 수정하기를 실패하였습니다");
								
							    	return "updateMypage";
							}
							
				 }else {
						System.out.println("로그인 정보가 없어 마이페이지를 출력 할 수 없습니다"); //실패 출력
						return "loginMember";
				}
		}

		
	//회원탈퇴 View (/del.do) 
	@RequestMapping("/del.do")
	public String del() {
		return "delMember";
	}		
	
	//회원탈퇴(delMember)
	@RequestMapping(value="/delMember", method = {RequestMethod.POST, RequestMethod.GET})	
	public String delMember (@ModelAttribute("memberDTO") MemberDTO memberDTO
														,@RequestParam("inputPwd") String inputPwd
														,HttpSession session, Model model) throws Exception {
			System.out.println("delMember 회원탈퇴 실행");
			
			//세션에 있는 키 값을 가져와 변수에 담고 비밀번호를 꺼낸다.
		 	MemberDTO delDTO = (MemberDTO)session.getAttribute("member");
			String member_pwd = delDTO.getMember_pwd();
			System.out.println("세션의 비밀번호 member_pwd: "+member_pwd);
			System.out.println("입력한 비밀번호 inputPwd:"+inputPwd);
		
			//세션 키값과 입력한 키값을 비교해서  탈퇴처리
			if(member_pwd.equals(inputPwd)) {
			//입력한 비밀번호와 DB정보가 같다면 아이디를 삭제
				
				String member_id = memberDTO.getMember_id();
				System.out.println("member_id: "+member_id);
				memberService.delMember(member_id);

				session.invalidate();	//로그아웃 처리
				return "main";
			
			}else {
				System.out.println("비밀번호가 맞지 않아요");
			    model.addAttribute("msg", "비밀번호가 맞지 않습니다.");
				
			return "delMember";
			}
	}

	
}



