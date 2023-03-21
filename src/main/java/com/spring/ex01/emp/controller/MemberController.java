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
	
	//로그인 View (/login.do) 
	@RequestMapping("/login.do")
	public String login() {
		return "loginMember";
	}
	
	//로그인(loginMember)
	@RequestMapping(value="/loginMember", method = {RequestMethod.POST, RequestMethod.GET})
	public String  loginMember(@ModelAttribute  MemberDTO memberDTO, RedirectAttributes rAttr,
																				HttpServletRequest req, HttpServletResponse resp
																				,Model model) throws Exception {

		System.out.println("check loginMember 로그인 컨트롤러 실행");//로그인 접속여부 출력
		
		memberDTO = memberService.loginMember(memberDTO);
	
		if(memberDTO != null) {
		  HttpSession session = req.getSession();
		  System.out.println("login session: "+session.getAttribute("isLogOn")); //세션정보 출력
		  
		  session.setAttribute("member", memberDTO);
		  session.setAttribute("isLogOn", true); // 세션 속성(true 로그인/ false 로그아웃)
			return "main";
			
		}else {
			System.out.println("loginFailed(로그인 실패)"); 	//실패 출력
			
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
																			HttpServletRequest req, HttpServletResponse resp
																			,Model model) throws Exception {
		System.out.println("check addMember 회원가입 컨트롤러 실행"); //로그인 접속여부 출력
		
			try {
				    memberService.addMember(memberDTO);	//회원정보를 SQL문에 전달
				    
				    
				    
				}catch(Exception e) {
					System.out.println("addFailed(회원가입 실패)");	//실패 출력
					  model.addAttribute("msg", "비밀번호가 다릅니다.");
					  model.addAttribute("result","loginFailed");
					
					e.printStackTrace();
				}
				
				return "addMember";
			}
	
	
	//회원 중복확인(checkMember)
	@RequestMapping(value="/checkMember",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody  String checkMember (@RequestParam("member_id") String member_id,
																				HttpServletRequest req,HttpServletResponse resp) throws Exception {
		System.out.println("check checkMember 중복체크 실행"); //중복체크 이벤트 실행 출력
		String result = memberService.checkMember(member_id);
		System.out.println("member_id: "+ member_id); //가져온 아이디 출력
		System.out.println("/checkMember : result : "+result); //결과 값 출력 true(사용 가능한 아이디)/false(사용 중인 아이디)
		return result;
	}
	
	
	//로그아웃(logout)
	  @RequestMapping(value="/logout",method={RequestMethod.POST, RequestMethod.GET})
	  public ModelAndView logout(HttpServletRequest req,	 
			  																	HttpServletResponse resp) throws Exception {
		  System.out.println("check logout"); //로그아웃 접속여부 확인

		  HttpSession session = req.getSession();	//세션정보를 불러오고
			System.out.println("logout session: "+session);	//세션 정보 출력
			
			session.setAttribute("isLogOn", false);	// 세션 속성(true 로그인/ false 로그아웃)
			session.removeAttribute("memberInfo");	//로그인 된 회원정보를 삭제한다.
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/main/main.do");	//로그아웃 후 메인 화면으로 보낸다.
			
			return mav;
	  }

		
	
	
	
	
	//회원탈퇴(delMember)
//	@RequestMapping(value="/delMember",method = RequestMethod.POST)	
//	public String delMember (HttpSession session,
//															RedirectAttributes red) throws Exception {
//		
//		MemberDTO delMember = (MemberDTO) session.getAttribute("member_id");
//		String sesionPwd = delMember.delMember();
//		String inputPwd =  memberDTO.delMember();
//			
//			if(!(sesionPwd.equals(inputPwd))) {
//				red.addFlashAttribute("massge", false);
//				
//				return "redirect:/main.do";
//			}
//			
//			serivce.delMember(delMember);
//			session.invalidate();
//			return "redirect:/main.do";
//				
//		}
	
	
	


//관리자페이지 회원리스트 (listMember)
//@RequestMapping(value="/listMember",method = RequestMethod.POST)		
//public String listMember (Model model,
//		HttpServletRequest req,HttpServletResponse resp) {
//	
//	List<MemberDTO> UserList = MemberService.listMember();//회원정보 조회할 때 사용할 수 있음
//	req.setAttribute("UserList", UserList);//조회한 정보를 req에 바인딩
//	
//}

	

//로그인 후 마이페이지 어떤 화면을 보여줄지 생각을 해보자.
//마이페이지 출력(mainMypage)
//	@RequestMapping(value="/mainMypage",method = RequestMethod.POST)	
//	public String mainMypage (Model model,
//			HttpServletRequest req,HttpServletResponse resp) {
//		
//		HttpSession session = req.getSession();
//		String member_id = (String)session.getAttribute("member_id");
//		System.out.println("session member_id값:" +member_id);
//		
//			if(member_id!=null) {
//				MemberDTO result = memberService.serPage(member_id);
//				req.setAttribute("result", result);
//				System.out.println(result);					
//				
//			} else {
//				System.out.println("session member_id값이 없습니다.");
//			}
//	}
	
	
	//마이페이지 회원 정보 수정(updateMypage)
//	@RequestMapping(value="/updateMypage",method = RequestMethod.POST)	
//	public String updateMypage (Model model,
//																HttpServletRequest req,HttpServletResponse resp) throws Exception {
//	
//		String member_id = req.getParameter("member_id");
//		String member_pwd1 = req.getParameter("member_pwd1");
//		String member_pwd2 = req.getParameter("member_pwd2");
//		String member_name = req.getParameter("member_name");
//		String member_email = req.getParameter("member_email");
//		String member_number = req.getParameter("member_number");
//		System.out.println("마이페이지 정보수정 :"+member_id+"/"+member_pwd1+"/"+member_pwd2);
//		System.out.println("마이페이지 정보수정 :"+member_name+"/"+member_email+"/"+member_number);
//		
//				if(member_pwd1.equals(member_pwd2)) {
//					memberDTO.setMember_id(member_id);
//					memberDTO.setMember_pwd(member_pwd1);
//					memberDTO.setMember_name(member_name);
//					memberDTO.setMember_email(member_email);
//					memberDTO.setMember_number(member_number);
//					actupdate.updateMypage(memberDTO);
//					
//					return "";
//					
//				}else {
//					String message="비밀번호가 맞지 않습니다.";
//					return "";
//				}
//	}
	
	
	

	//마이페이지 영화 예매내역 출력(movieMypage)
//	@RequestMapping(value="/movieMypage",method = RequestMethod.GET)	
//	public String delMember () throws Exception {
//	}
		
		
	//마이페이지 스토어 구매내역 출력(stroreMypage)
//	@RequestMapping(value="/storeMypage",method = RequestMethod.GET)	
//	public String delMember () throws Exception {
//	}
	
	
	
	
}



