package com.spring.ex01.emp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.service.MovieService;
import com.spring.ex01.emp.service.TheaterService;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService theaterService;

	@Autowired
	private MovieService movieService;
	
	
	@RequestMapping(value="/theater.do", method=RequestMethod.GET)
	public String theater(Model model, HttpSession session) {
		System.out.println("���������� ���");
		model.addAttribute("memberList",session.getAttribute("id"));
//		��ü��������
		List theaterList = theaterService.theaterList();
		model.addAttribute("theaterList",theaterList);
		
//		��ü��ȭ����
		List movieList = movieService.movieList();
		model.addAttribute("movieList",movieList);
//		��ü������
		List showList = theaterService.showList();
		model.addAttribute("showList",showList);
		model.addAttribute("area_id","id_seoul");
		return "theater/theater";
	}
	
	@RequestMapping(value="/theaterList.do", method=RequestMethod.GET)
	public String theaterList(Model model, HttpSession session,
			@RequestParam(value="area_id", required=false) String area_id
			) {
//		��ü��������
		List theaterList = theaterService.theaterList();
		model.addAttribute("theaterList",theaterList);
		
//		��ü��ȭ����
		List movieList = movieService.movieList();
		model.addAttribute("movieList",movieList);
//		��ü������
		List showList = theaterService.showList();
		model.addAttribute("showList",showList);
		
		model.addAttribute("area_id",area_id);
		
		
		return "theater/theater";
	}
	
	
}
