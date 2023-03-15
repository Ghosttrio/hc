package com.spring.ex01.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.service.MovieService;

@Controller("mainController")
public class MainController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
//	영화출력
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String movieList(Model model) {
		System.out.println("메인 실행");
		List movieList = movieService.movieList();
		model.addAttribute("movieList", movieList);
		return "main/main";
	}
	
}
