package com.spring.ex01.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.ex01.emp.service.MovieService;

@RestController("likeController")
@RequestMapping("/like")
public class LikeController {

	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public int movieLike(
			@RequestParam(value="command1", required=false) String command1,
			@RequestParam(value="articleNO1", required=false) String articleNO1) {
		System.out.println("���ƿ� �޼ҵ� ����");
		System.out.println(command1);
		System.out.println(articleNO1);
		int like = 0;
		if(articleNO1 != null) {
			int articleNO = Integer.parseInt(articleNO1);
			if(command1 == null || command1.equals("like_it")) {
				movieService.updateLike(articleNO);
				like = movieService.selectLike(articleNO);
				System.out.println(like);
			}
		}
		return like;
	}
}
