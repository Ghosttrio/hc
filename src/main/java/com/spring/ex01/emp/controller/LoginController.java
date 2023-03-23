package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.LoginDTO;
import service.LoginService;
import service.MovieService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private LoginDTO loginDTO;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		System.out.println("로그인창출력");
		return "login/login";
	}
	
	@RequestMapping(value="/loginDo.do", method=RequestMethod.GET)
	public String loginDo(Model model, HttpSession session,
			@RequestParam(value="id", required=false) String id,
			@RequestParam(value="pw", required=false) String pw) {
		System.out.println("로그인 실행");
		System.out.println(id);
		System.out.println(pw);
		
		if(id == null || id.equals("")) {
			System.out.println("1");
			String msg = "�엯�젰�젙蹂대�� �솗�씤�븯�꽭�슂";
			model.addAttribute("msg", msg);
			return "login/login";
		} else if(pw ==null || pw.equals("")) {
			System.out.println("2");
			String msg = "�엯�젰�젙蹂대�� �솗�씤�븯�꽭�슂";
			model.addAttribute("msg", msg);
			return "login/login";
		} else {
			System.out.println("3");
			loginDTO.setId(id);
			loginDTO.setPw(pw);
			List memberList = loginService.memberList(loginDTO);
			if(memberList.size() == 0) {
				System.out.println("4");
				String msg = "�엯�젰�젙蹂대�� �솗�씤�븯�꽭�슂";
				model.addAttribute("msg", msg);
				return "login/login";
			} else {
				System.out.println("5");
//				model.addAttribute("memberList",memberList);
				session.setAttribute("id", id);                 // �꽭�뀡�뿉 媛믪쓣 �뀑�똿�븯�뒗 諛⑸쾿
			    String sessionId = (String) session.getAttribute("id");  // �꽭�뀡�뿉�꽌 媛믪쓣 媛��졇�삤�뒗 諛⑸쾿		
			    model.addAttribute("memberList",session.getAttribute("id"));
			    List movieList = movieService.movieList();
			    model.addAttribute("movieList",movieList);
			    return "main/main";
			}
		}
		
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		System.out.println("濡쒓렇�븘�썐�떎�뻾");
		session.invalidate();
		List movieList = movieService.movieList();
	    model.addAttribute("movieList",movieList);
		return "main/main";
	}
	
////	濡쒓렇�씤 �꽭�뀡
//	HttpSession session = request.getSession();
////	request.getParameter("")�뿉 id �쟾�떖�븯�뒗 name媛�
//	String id = request.getParameter("");
////	request.getParameter("")�뿉 pwd �쟾�떖�븯�뒗 name媛�
//	String pwd = request.getParameter("");
//	
//	if(session.isNew()) {
//		if(id != null) {
//			session.setAttribute("id", pwd);
//		} else {
//			session.invalidate();
//		}
//	} else {
//		id = (String) session.getAttribute("");
//		if(id != null && id.length() != 0) {
//			System.out.println("濡쒓렇�씤�꽦怨�");
//		} else {
//			// 濡쒓렇�씤�븯硫� �뿬湲곗꽌 濡쒓렇�븘�썐 �떆�궡... 洹몃옒�꽌 二쇱꽍泥섎━ �븿
//			//session.invalidate();
//		}
//	}
	
	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public String signup() {
		System.out.println("�쉶�썝媛��엯李� 異쒕젰");
		return "login/signup";
	}
	
	@RequestMapping(value="/memberInsert.do", method=RequestMethod.GET)
	public String memberInsert(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("name") String name,
			@RequestParam("phone") String phone) {
		System.out.println("�쉶�썝媛��엯 �떎�뻾");
		
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		loginDTO.setName(name);
		loginDTO.setPhone(phone);
		
		loginService.memberInsert(loginDTO);
		
		return "redirect:/loginDo.do";
	}
}
