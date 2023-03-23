package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.MovieService;
import service.TheaterService;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService theaterService;

	@Autowired
	private MovieService movieService;
	
	
	@RequestMapping(value="/theater.do", method=RequestMethod.GET)
	public String theater(Model model, HttpSession session) {
		System.out.println("극장페이지 출력");
		model.addAttribute("memberList",session.getAttribute("id"));
//		전체극장정보
		List theaterList = theaterService.theaterList();
		model.addAttribute("theaterList",theaterList);
		
//		전체영화정보
		List movieList = movieService.movieList();
		model.addAttribute("movieList",movieList);
//		전체상영정보
		List showList = theaterService.showList();
		model.addAttribute("showList",showList);
		model.addAttribute("area_id","id_seoul");
		return "theater/theater";
	}
	
	@RequestMapping(value="/theaterList.do", method=RequestMethod.GET)
	public String theaterList(Model model, HttpSession session,
			@RequestParam(value="area_id", required=false) String area_id
			) {
//		전체극장정보
		List theaterList = theaterService.theaterList();
		model.addAttribute("theaterList",theaterList);
		
//		전체영화정보
		List movieList = movieService.movieList();
		model.addAttribute("movieList",movieList);
//		전체상영정보
		List showList = theaterService.showList();
		model.addAttribute("showList",showList);
		
		model.addAttribute("area_id",area_id);
		
		
		return "theater/theater";
	}
	
	
}
