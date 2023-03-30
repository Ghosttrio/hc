package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.MovieDTO;
import com.spring.service.MovieServiceImpl;

@Controller
public class ManagerController {
	
	@Autowired
	private MovieDTO movieDTO;
	@Autowired
	private MovieServiceImpl movieService;
	
//	영화 관리자페이지
	@RequestMapping(value="/movieManager.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="command", required=false) String command,
			@RequestParam(value="articleNO", required=false) String articleNO,
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
		System.out.println("영화관리실행");
		
		if(command != null && command.equals("add")){
			System.out.println("영화 추가 실행");
			movieDTO.setArticleNO1(articleNO);
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
			System.out.println("영화 수정 실행");
			
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
			System.out.println("영화 삭제 실행");
			movieService.del(title);
		} 
		
		List movieList = movieService.movieList();
		model.addAttribute("movieList", movieList);
		
		return "manager/movieManager";
	}
	
//	영화 추가창 실행
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String movieAdd(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO) {
		System.out.println("영화 추가창 실행");
		
		model.addAttribute("articleNO", articleNO);
		
		return "manager/add";
	}

	
//	영화 수정창 실행
	@RequestMapping(value="/update.do", method=RequestMethod.POST) 
	public String movieUpdate(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO) { 
		System.out.println("영화 수정창 실행"); 
		
		List movieList = movieService.viewArticle(articleNO);
		
		model.addAttribute("movieList", movieList);
		
		return "manager/update"; 
	}
	
	
	

	
}
