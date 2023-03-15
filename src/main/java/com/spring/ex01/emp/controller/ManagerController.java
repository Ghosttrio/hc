package com.spring.ex01.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.service.MovieService;

@Controller("managerController")
@RequestMapping("/movieManager")
public class ManagerController {

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
//	��ȭ���
	
	@RequestMapping(value="/movieManager.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="command", required=false) String command,
			@RequestParam(value="title", required=false) String title,
			@RequestParam(value="title_en", required=false) String title_en,
			@RequestParam(value="age", required=false) String age,
			@RequestParam(value="opendate", required=false) String opendate,
			@RequestParam(value="explain", required=false) String explain,
			@RequestParam(value="director", required=false) String director,
			@RequestParam(value="genre", required=false) String genre,
			@RequestParam(value="runningtime", required=false) String runningtime,
			@RequestParam(value="actor", required=false) String actor,
			@RequestParam(value="poster_back", required=false) String poster_back,
			@RequestParam(value="poster_main", required=false) String poster_main) {
		System.out.println("영화관리자페이지 출력");
		
		if(command != null && command.equals("add")){
			System.out.println("영화추가");
			movieDTO.setTitle(title);
			movieDTO.setTitle_en(title_en);
			movieDTO.setAge(age);
			movieDTO.setOpendate(opendate);
			movieDTO.setExplain(explain);
			movieDTO.setDirector(director);
			movieDTO.setGenre(genre);
			movieDTO.setRunningtime(runningtime);
			movieDTO.setActor(actor);
			movieDTO.setPoster_back(poster_back);
			movieDTO.setPoster_main(poster_main);
			movieService.add(movieDTO);
		} else if(command != null && command.equals("update")) {
			System.out.println("영화수정");
			System.out.println(opendate);
			System.out.println(age);
			System.out.println(title_en);
			
			movieDTO.setTitle(title);
			movieDTO.setTitle_en(title_en);
			movieDTO.setAge(age);
			movieDTO.setOpendate(opendate);
			movieDTO.setExplain(explain);
			movieDTO.setDirector(director);
			movieDTO.setGenre(genre);
			movieDTO.setRunningtime(runningtime);
			movieDTO.setActor(actor);
			movieDTO.setPoster_back(poster_back);
			movieDTO.setPoster_main(poster_main);
			movieDTO.setTitle(title);
			movieService.up(movieDTO);
		} else if(command != null && command.equals("delete")) {
			System.out.println("영화삭제");
			System.out.println(command);
			System.out.println(title);
			movieService.del(title);
		} 
		List movieList = movieService.movieList();
		model.addAttribute("movieList", movieList);
		return "movieManager/manager";
	}
	
	
//	} else if(command != null && command.equals("del")) {
//		String title = request.getParameter("title");
//		System.out.println("���� ����:" + title);


	
	
	
	
	
	
	
	
	
	
	
//	��ȭ�߰������� ���
//	영화추가
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String movieAdd(Model model) {
		System.out.println("�߰������� ���");
		return "movieManager/add";
	}
	
//	��ȭ���������� ���
//	영화수정
	@RequestMapping(value="/update.do", method=RequestMethod.POST) 
	public String movieUpdate(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO) { 
		System.out.println("���������� ���"); 
		List movieList = movieService.viewArticle(articleNO);
		model.addAttribute("movieList", movieList);
		return "movieManager/update"; 
	}
	 
}
