package com.spring.ex01.emp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.service.MovieService;

	
@Controller("bookingController")
public class BookingController {

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
	@RequestMapping(value="/booking.do", method=RequestMethod.GET)
	public String Ticketing(Model model, HttpSession session/*,
			@RequestParam(value="", required=false) String */) {
//		영화 리스트 출력
		List movieList = movieService.movieList();
//		극장 리스트 출력
		List theaterList = movieService.theaterList();
//		영화 리스트 전달
		model.addAttribute("movieList", movieList);
//		극장 리스트 전달
		model.addAttribute("theaterList", theaterList);
//		아이디 세션 전달
		model.addAttribute("memberList",session.getAttribute("id"));
		return "/booking/booking";
	}
	
	@RequestMapping(value="/t_movie.do", method=RequestMethod.GET)
	public String Ticketing_movie(Model model,
			@RequestParam(value="articleNO", required=false) String articleNO,
			@RequestParam(value="theater_id", required=false) String theater_id,
			@RequestParam(value="showdate", required=false) String showdate,
			@RequestParam(value="showtime", required=false) String showtime) {
		
//		articleNO에 맞는 영화, 영화관, 날짜 출력
		System.out.println(articleNO);
		System.out.println(theater_id);
		System.out.println(showdate);
		System.out.println(showtime);
		System.out.println("--------------");
		movieDTO.setArticleNO1(articleNO);
		movieDTO.setTheater_id(theater_id);
		movieDTO.setShowdate(showdate);
		movieDTO.setShowtime(showtime);
		
		List movieList = movieService.movieList();
		List theaterList = movieService.theaterList();
		List showList = movieService.showList(movieDTO);
		
		
		model.addAttribute("articleNO", articleNO);
		model.addAttribute("theater_id", theater_id);
		model.addAttribute("showdate", showdate);
		model.addAttribute("showtime", showtime);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("showList", showList);
		return "booking/booking";
	}
	
	@RequestMapping(value="/pay.do", method=RequestMethod.GET)
	public String pay(Model model,
			@RequestParam(value="articleNO", required=false) String articleNO,
			@RequestParam(value="theater_id", required=false) String theater_id,
			@RequestParam(value="showdate", required=false) String showdate,
			@RequestParam(value="showtime", required=false) String showtime) {
		
//		articleNO에 맞는 영화, 영화관, 날짜 출력
		System.out.println(articleNO);
		System.out.println(theater_id);
		System.out.println(showdate);
		System.out.println(showtime);
		System.out.println("--------------");
		movieDTO.setArticleNO1(articleNO);
		movieDTO.setTheater_id(theater_id);
		movieDTO.setShowdate(showdate);
		movieDTO.setShowtime(showtime);
		
		List movieList = movieService.movieList();
		List theaterList = movieService.theaterList();
		List showList = movieService.showList(movieDTO);
		
		model.addAttribute("articleNO", articleNO);
		model.addAttribute("theater_id", theater_id);
		model.addAttribute("showdate", showdate);
		model.addAttribute("showtime", showtime);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("showList", showList);
		return "booking/pay";
	}
	
}