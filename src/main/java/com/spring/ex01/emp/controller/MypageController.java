package com.spring.ex01.emp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String movie(Model model, HttpSession session) {
		System.out.println("마이페이지 출력");
		model.addAttribute("memberList",session.getAttribute("id"));
		return "mypage/mypage";
	}
}
