package com.spring.controller;

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

import com.spring.dto.MovieDTO;
import com.spring.service.MovieServiceImpl;

@Controller("commentController")
public class CommentController {

	@Autowired
	private MovieServiceImpl movieService;
	
	@Autowired
	private MovieDTO movieDTO;
	
// 댓글 실행
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public String movieList(Model model, HttpSession session,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="comment_id", required=false) String comment_id,
			@RequestParam(value="totArticles", required=false) int totArticles,
			@RequestParam(value="comment_text", required=false) String comment_text,
			@RequestParam(value="comment_rate", required=false) int comment_rate,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			) {
		System.out.println("댓글창 실행");
		
//		articleNO에 맞는 영화 상세창 출력
		List article = movieService.viewArticle(articleNO);
		model.addAttribute("movieList", article);
		
//		댓글 입력
		movieDTO.setArticleNO(articleNO);
		movieDTO.setComment_id(comment_id);
		movieDTO.setComment_text(comment_text);
		movieDTO.setComment_rate(comment_rate);
		movieService.insertComment(movieDTO);

//		페이징 처리
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
	
	@RequestMapping(value="/reply2.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="articleNO", required=false) int articleNO,
			@RequestParam(value="recommentNO", required=false) int commentNO,
			@RequestParam(value="recomment_text", required=false) String recomment_text,
			@RequestParam(value="recomment_id", required=false) String recomment_id,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum,
			@RequestParam(value="command", required=false) String command) {
		System.out.println("대댓글 실행");
		
//		대댓글 입력
		List article  = movieService.viewArticle(articleNO);
		model.addAttribute("movieList", article);
		movieDTO.setArticleNO(articleNO);
		movieDTO.setParentNO(commentNO);
		movieDTO.setComment_text(recomment_text);
		movieDTO.setComment_id(recomment_id);
		movieService.insertComment2(movieDTO);
		
//		페이징 처리
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
	
	
//	댓글 삭제
	@RequestMapping(value="/reply_del.do", method=RequestMethod.GET)
	public String movieList(Model model,
			@RequestParam(value="commentNO", required=false) int commentNO,
			@RequestParam(value="articleNO", required=false) int articleNO
			) {
		System.out.println("댓글삭제 실행");
		
		movieService.deleteComment(commentNO);
		
		return "redirect:/movieInfo.do?articleNO="+articleNO;
	}

}
