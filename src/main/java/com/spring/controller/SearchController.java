package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dto.MovieDTO;
import com.spring.service.MovieServiceImpl;

@RestController
public class SearchController {

	@Autowired
	MovieServiceImpl movieService;

	@Autowired
	MovieDTO movieDTO;
	
//	영화 검색 실행
    @GetMapping("/search.do")
    public List search() {
    	List movieList = movieService.movieList();
        return movieList;
    }

}
