package com.spring.ex01.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.service.MovieService;

@RestController
public class searchController {

	@Autowired
	MovieService movieService;

	@Autowired
	MovieDTO movieDTO;
	

    @GetMapping("/search.do")
    public List search() {
    	List movieList = movieService.movieList();
        return movieList;
    }

}
