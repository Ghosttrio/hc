package controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.MovieService;


@Controller
public class MainController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
//		영화 출력
		System.out.println("메인탭 출력");
//		로그인 세션이 있으면 세션 전달
		model.addAttribute("memberList", session.getAttribute("id"));
		List movieList = movieService.movieList();
		
		model.addAttribute("movieList",movieList);
		
		return "main/main";
	}
	
	
}
