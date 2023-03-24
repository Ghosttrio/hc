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
	
// ?���?
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="comment_text", required=false) String comment_text,
			@RequestParam(value="comment_id", required=false) String comment_id,
			@RequestParam(value="comment_rate", required=false) int comment_rate,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum) {
		System.out.println("��� ����");
		List article = movieService.viewArticle(articleNO);
//		?�� ?��같�?�? ?��번하�??
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
		
//		comment ���� �Է�
		
		return "redirect:/movieInfo.do?articleNO="+articleNO;
	}
	
	@RequestMapping(value="/reply2.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="commentNO", required=false) int commentNO,
			@RequestParam(value="comment_text", required=false) String recomment_text,
			@RequestParam(value="comment_id", required=false) String recomment_id,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum) {
		System.out.println("���� ����");
		List article  = movieService.viewArticle(articleNO);
		model.addAttribute("movieList", article);
		movieDTO.setArticleNO(articleNO);
		movieDTO.setCommentNO(commentNO);
		movieDTO.setComment_text(recomment_text);
		movieDTO.setComment_id(recomment_id);
		movieService.insertComment2(movieDTO);
		
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
		
		
		return "redirect:/movieInfo.do?articleNO="+articleNO;
	}
	

}
