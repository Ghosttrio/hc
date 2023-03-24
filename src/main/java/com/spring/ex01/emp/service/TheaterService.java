package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.MovieDAO;
import com.spring.ex01.emp.dao.TheaterDAO;
import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.dto.TheaterDTO;

@Service
public class TheaterService {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private TheaterDAO theaterDAO;
	
	
	public List theaterList() {
		List theaterList = theaterDAO.theaterList();
		return theaterList;
	}
	public List showList() {
		List showList = theaterDAO.showList();
		return showList;
	}
	
	
//	占쏙옙화占쏙옙占�
	public List movieList(MovieDTO movieDTO) {
		List movieList = theaterDAO.movieList(movieDTO);
		return movieList;
	}
	
	public List theaterList(TheaterDTO theaterDTO) {
		List theaterList = theaterDAO.theaterList(theaterDTO);
		return theaterList;
	}
	
	public List showList(TheaterDTO theaterDTO) {
		List showList = theaterDAO.showList(theaterDTO);
		return showList;
	}
	

	
	
	
	
	
	
}
