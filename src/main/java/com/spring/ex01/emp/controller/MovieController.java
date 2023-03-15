package com.spring.ex01.emp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.service.MovieService;

@Controller("movieController")
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
//	영화출력
	@RequestMapping(value="/movieTab.do", method=RequestMethod.GET)
	public String movieList(Model model) {
		System.out.println("영화탭 실행");
		List movieList = movieService.movieList();
//		List list2 = movieService.movieList2();
		model.addAttribute("movieList", movieList);
//		model.addAttribute("movieList2", list2);
		return "movie/movieTab";
	}
	
//	영화상세창 출력
	@RequestMapping(value="/movieInfo.do", method=RequestMethod.GET)
	public String movieInfo(Model model,
			// movieTab에서 articleNO 전달 후 articleNO에 맞는 테이블 포워딩
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum) {
		System.out.println(articleNO + "번 영화 상세창 출력");
		List list = movieService.viewArticle(articleNO);
		model.addAttribute("article", list);
		model.addAttribute("movieList", list);
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		
		
		
		Map pagingMap = new HashMap();
		pagingMap.put("section", section_);
		pagingMap.put("pageNum", pageNum_);
		pagingMap.put("articleNO", articleNO);
		
		System.out.println(section_);
		System.out.println(pageNum_);
		System.out.println(articleNO);
		
		Map articlesMap = movieService.commentList(pagingMap);
		articlesMap.put("section", section_);
		articlesMap.put("pageNum", pageNum_);
		model.addAttribute("articlesMap", articlesMap);
		
		
		return "movie/movieInfo";
	}
	
	
}
