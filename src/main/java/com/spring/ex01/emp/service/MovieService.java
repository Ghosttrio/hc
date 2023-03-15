package com.spring.ex01.emp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.MovieDAO;
import com.spring.ex01.emp.dto.MovieDTO;


@Service("movieService")
public class MovieService {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private MovieDTO movieDTO;
	
	
//	��ȭ���
	public List movieList() {
		List movieList = movieDAO.movieList();
		return movieList;
	}
	
//	articleNO�� �´� ��ȭ���
	public List viewArticle(int articleNO) {
		List article = movieDAO.viewArticle(articleNO);
		return article;
	}
	
//	��ȭ�߰�
	public void add(MovieDTO movieDTO) {
		movieDAO.movieAdd(movieDTO);
	}
	
//	영화 수정
	public void up(MovieDTO movieDTO) {
		movieDAO.movieUpdate(movieDTO);
	}
	
//	영화 삭제
	public void del(String title) {
		movieDAO.movieDelete(title);
	}
	
//	���ƿ� ������Ʈ
	public void updateLike(int articleNO) {
		movieDAO.update_Like(articleNO);
	}
	
//	���ƿ� ���
	public int selectLike(int articleNO) {
		int like = movieDAO.select_Like(articleNO);
		return like;
	}
	
//	댓글 입력
	public void insertComment(MovieDTO movieDTO) {
		movieDAO.insertComment(movieDTO);
	}
	
//	페이징기능
	
	public Map commentList(Map pagingMap) {
		Map articlesMap = new HashMap();
		List articlesList = movieDAO.movieList(pagingMap);
		int totArticles = movieDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		return articlesMap;
	}
//	public void upComment2(MovieDTO movieDTO) {
//		movieDAO.upComment2(articleNO, upComment2, comment_id, comment_text);
//	}
	
}
