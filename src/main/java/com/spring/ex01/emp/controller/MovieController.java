package com.spring.ex01.emp.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
//	영화탭출력
	@RequestMapping(value="/movie.do", method=RequestMethod.GET)
	public String movie(Model model, HttpSession session) {
		System.out.println("영화탭출력");
		model.addAttribute("memberList",session.getAttribute("id"));
		List movieList = movieService.movieList();
		model.addAttribute("movieList",movieList);

        // 현재 날짜 구하기
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        // 포맷 적용
        String formatedNow = now.format(formatter);
        model.addAttribute("formatedNow",formatedNow);
		
		return "movie/movie";
	}
	
//	영화상세출력
	@RequestMapping(value="/movieInfo.do", method=RequestMethod.GET)
	public String movieInfo(Model model, HttpSession session,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum) {
		System.out.println(articleNO + "번 상세정보 출력");
		List list = movieService.viewArticle(articleNO);
//		articleNO에 맞는 영화리스트
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
		model.addAttribute("memberList",session.getAttribute("id"));
		
		return "movie/movieInfo";
	}
}
