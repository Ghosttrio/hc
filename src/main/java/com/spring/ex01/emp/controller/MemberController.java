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
	
	//로그인 View (/login.do) 
	@RequestMapping("/login.do")
	public String login() {
		return "loginMember";
	}
	
<<<<<<< HEAD
=======
	   //로그인 View (/login.do) 
	   @RequestMapping("/login.do")
	   public String login() {
	      return "loginMember";
	   }
	   
	
	
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
	//로그인(loginMember)
	@RequestMapping(value="/loginMember", method = {RequestMethod.POST, RequestMethod.GET})
	public String  loginMember(@ModelAttribute  MemberDTO memberDTO ,	Model model
													,HttpServletRequest req, HttpServletResponse resp	) throws Exception {

		memberDTO = memberService.loginMember(memberDTO);
	
		if(memberDTO != null) {
		  HttpSession session = req.getSession();
		  session.setAttribute("member", memberDTO);
		  session.setAttribute("isLogOn", true); 
		  System.out.println("login session: "+session.getAttribute("isLogOn"));
		  return "main";
			
		}else {
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
	public String addMember(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model
														,HttpServletRequest req, HttpServletResponse resp) throws Exception {
				
				try {
				    memberService.addMember(memberDTO);
				    model.addAttribute("result","signupSucceed");
				    model.addAttribute("msg", "가입을 환영합니다.");
				    System.out.println("/addMember Succeed 회원가입 성공");
				    
				}catch(Exception e) {
					// catch의 전달인자는 꼭 필수이다.
					System.out.println("/addMember failed 회원가입 실패");
					return "addMember";
				}
				return "forward:/member/login.do";
			}
	
	//회원 중복확인(checkMember)
	@RequestMapping(value="/checkMember", method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody  String checkMember (@RequestParam("member_id") String member_id) throws Exception {

		String result = memberService.checkMember(member_id);
		return result;
	}
	
	//로그아웃(logout)
	  @RequestMapping(value="/logout", method={RequestMethod.POST, RequestMethod.GET})
	  public String logout(HttpServletRequest req,	 HttpServletResponse resp) throws Exception {

		  HttpSession session = req.getSession();
			session.invalidate();
			return "redirect:/member/login.do";
	  }
	  
	  //마이페이지 View 출력(mypage.do)
		@RequestMapping(value="/mypage.do", method={RequestMethod.POST, RequestMethod.GET})	
		public String mainMypage (Model model
												, HttpServletRequest req,	HttpServletResponse resp	) throws Exception {
			
				 HttpSession session = req.getSession();
				 if( (boolean)session.getAttribute("isLogOn")==true ) {
					 System.out.println("로그인 세션출력 isLogOn(true : "+session.getAttribute("isLogOn"));
					 
					 MemberDTO memberDTO = new MemberDTO();
					 memberDTO = (MemberDTO)session.getAttribute("member");
					 memberDTO = memberService.mypage(memberDTO);
					 
					 model.addAttribute("result", memberDTO);
					 //result 키 값을 return mypage 로 보낸다.
					 
					 return "mainMypage";
					 //return 값은 tiles name을 쓰며 tiles를 JSP로 출력한다.
					 
				}else {
					System.out.println("로그인 정보가 없어 마이페이지를 출력 할 수 없습니다"); //실패 출력
					return "loginMember";
				}
		}

	
}



