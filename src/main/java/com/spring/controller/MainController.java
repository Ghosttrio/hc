package com.spring.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.MovieServiceImpl;


@Controller
public class MainController {
	
	@Autowired
	private MovieServiceImpl movieService;
	
//	메인창 출력
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		System.out.println("메인창 출력");
		
		model.addAttribute("memberList", session.getAttribute("id"));
		List movieList = movieService.movieList();
		
		model.addAttribute("movieList",movieList);

		return "main/main";
	}
	
	
}
