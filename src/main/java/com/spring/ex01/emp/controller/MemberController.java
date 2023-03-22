package com.spring.ex01.emp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex01.emp.dto.MemberDTO;
import com.spring.ex01.emp.service.MemberService;

@Controller("memberController")
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	private MemberService memberService;
	@Autowired	private MemberDTO memberDTO;
	
	//로그인(loginMember)
		@RequestMapping(value="/loginMember", method = {RequestMethod.POST, RequestMethod.GET})
		public String  loginMember(@ModelAttribute  MemberDTO memberDTO ,Model model,
																					HttpServletRequest req, HttpServletResponse resp
																					) throws Exception {

			System.out.println("check loginMember 로그인 실행");//로그인 접속여부 출력
			memberDTO = memberService.loginMember(memberDTO);
		
			if(memberDTO != null) {
			  HttpSession session = req.getSession();
			  System.out.println("login session: "+session.getAttribute("isLogOn")); //세션정보 출력
			  
			  session.setAttribute("member", memberDTO);
			  session.setAttribute("isLogOn", true); // 세션 속성(true 로그인/ false 로그아웃)
				return "main";
				
			}else {
				System.out.println("loginFailed(loginMember)"); //실패 출력
				
//				전달인자 값이 ModelAndView일 때 사용
//				 rAttr.addAttribute("result","loginFailed");
//				mav.setViewName("loginMember"); //ModelAndView에서 viewResolver를 탄다.
				  model.addAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
				  model.addAttribute("result","loginFailed");
				  
				  return "loginMember";
			}
		}
		
		//회원가입 View (/add.do) 
		@RequestMapping("/add.do")
		public String add() {
			
			return "addMember";
		}
		
		
		//회원가입(addMember)
		@RequestMapping(value="/addMember", method = {RequestMethod.POST, RequestMethod.GET})
		public String addMember(@ModelAttribute("memberDTO") MemberDTO memberDTO, 	//회원가입 정보를 _memberDTO에 설정
																				Model model	,HttpServletRequest req, HttpServletResponse resp) throws Exception {
			System.out.println("check addMember 회원가입 실행");
			System.out.println("입력 받은 id 값: "+memberDTO.getMember_id());
					
					try {
					    memberService.addMember(memberDTO);	//회원정보를 SQL문에 전달
					    model.addAttribute("result","signupSucceed"); //request처럼 redirect를 하면 사라진다.
					    model.addAttribute("msg", "가입을 환영합니다.");
					    System.out.println("/addMember Succeed 회원가입 성공");
					    
					}catch(Exception e) {
						// catch에 전달인자는 꼭 필수이다.
						System.out.println("/addMember failed 회원가입 실패");
						return "addMember";
						
					}
					
					return "forward:/member/login.do";
					//model 정보를 가져오려면 forward 해줘야 한다.
				}
		
		
		//회원 중복확인(checkMember)
		@RequestMapping(value="/checkMember", method = {RequestMethod.POST, RequestMethod.GET})
		public @ResponseBody  String checkMember (@RequestParam("member_id") String member_id,
																					HttpServletRequest req,HttpServletResponse resp) throws Exception {
			System.out.println("check checkMember 중복체크 실행");
			
			String result = memberService.checkMember(member_id);
			System.out.println("member_id: "+ member_id); //가져온 아이디 출력
			System.out.println("/checkMember 의 결과 값이 (false=가능/true:불가능) : "+result); //결과 값 출력 true(사용 가능한 아이디)/false(사용 중인 아이디)
			return result;
		}
		
		
		//로그아웃(logout)
		  @RequestMapping(value="/logout", method={RequestMethod.POST, RequestMethod.GET})
		  public String logout(HttpServletRequest req,	 HttpServletResponse resp) throws Exception {
			  System.out.println("check logout 로그아웃 실행"); 

			  HttpSession session = req.getSession();	//세션정보를 불러오고
				System.out.println("logout session: "+session);	//세션 정보 출력
				
				session.invalidate();	//로그인 된 회원정보를 삭제한다.
				
				return "redirect:/member/login.do";
		  }
		
	
}



