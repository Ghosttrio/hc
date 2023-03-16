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

@Controller("commentController")
public class CommentController {

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
// 댓글
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="comment_text", required=false) String comment_text,
			@RequestParam(value="comment_id", required=false) String comment_id,
			@RequestParam(value="comment_rate", required=false) int comment_rate,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum) {
		System.out.println("댓글 실행");
		List article = movieService.viewArticle(articleNO);
//		왜 똑같은걸 두번하지?
		model.addAttribute("article", article);
		model.addAttribute("movieList", article);
		movieDTO.setArticleNO(articleNO);
		movieDTO.setComment_id(comment_id);
		movieDTO.setComment_text(comment_id);
		movieDTO.setComment_rate(comment_rate);
		movieService.insertComment(movieDTO);
		
		
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		
		
		Map pagingMap = new HashMap();
		pagingMap.put("section", section_);
		pagingMap.put("pageNum", pageNum_);
		pagingMap.put("articleNO", articleNO);
		Map articlesMap = movieService.commentList(pagingMap);
		articlesMap.put("section", section_);
		articlesMap.put("pageNum", pageNum_);
		model.addAttribute("articlesMap", articlesMap);
		
		return "redirect:/movie/movieInfo.do?articleNO="+articleNO;
	}
	
}
