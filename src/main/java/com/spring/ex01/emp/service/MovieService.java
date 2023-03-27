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
	
//	영화 출력
	public List movieList() {
		List movieList = movieDAO.movieList();
		return movieList;
	}
//	영화 출력 dto
	public MovieDTO movieList_dto() {
		MovieDTO movieList = movieDAO.movieList_dto();
		return movieList;
	}
	
//	articleNO占쏙옙 占승댐옙 占쏙옙화占쏙옙占�
	public List viewArticle(int articleNO) {
		List article = movieDAO.viewArticle(articleNO);
		return article;
	}
	
//	占쏙옙화占쌩곤옙
	public void add(MovieDTO movieDTO) {
		movieDAO.movieAdd(movieDTO);
	}
	
//	�쁺�솕 �닔�젙
	public void up(MovieDTO movieDTO) {
		movieDAO.movieUpdate(movieDTO);
	}
	
//	�쁺�솕 �궘�젣
	public void del(String title) {
		movieDAO.movieDelete(title);
	}
	
//	占쏙옙占싣울옙 占쏙옙占쏙옙占쏙옙트
	public void updateLike(int articleNO) {
		movieDAO.update_Like(articleNO);
	}
	
//	占쏙옙占싣울옙 占쏙옙占�
	public int selectLike(int articleNO) {
		int like = movieDAO.select_Like(articleNO);
		return like;
	}
	
//	�뙎湲� �엯�젰
	public void insertComment(MovieDTO movieDTO) {
		movieDAO.insertComment(movieDTO);
	}
	
//	�뙎湲� �엯�젰
	public void insertComment2(MovieDTO movieDTO) {
		movieDAO.insertComment2(movieDTO);
	}
	
	
	
	
	
//	�럹�씠吏뺢린�뒫
	
	public Map commentList(Map pagingMap) {
		Map articlesMap = new HashMap();
		List articlesList = movieDAO.movieList(pagingMap);
		int totArticles = movieDAO.selectTotArticles();
//		섹션, 페이징에 맞는 댓글리스트 출력
		articlesMap.put("articlesList", articlesList);
//		댓글 총개수 출력 --> 부모댓글의 총개수 출력으로 변경하기
		articlesMap.put("totArticles", totArticles);
		return articlesMap;
	}
	public List theaterList() {
		List theaterList = movieDAO.theaterList();
		return theaterList;
	}
	public List showList() {
		List showList = movieDAO.showList();
		return showList;
	}
	
	
	
	
	
//	占쏙옙화占쏙옙占�
	public List movieList(MovieDTO movieDTO) {
		List movieList = movieDAO.movieList(movieDTO);
		return movieList;
	}
	
	public List theaterList(MovieDTO movieDTO) {
		List theaterList = movieDAO.theaterList(movieDTO);
		return theaterList;
	}
	
	public List showList(MovieDTO movieDTO) {
		List showList = movieDAO.showList(movieDTO);
		return showList;
	}
	


//	public void upComment2(MovieDTO movieDTO) {
//		movieDAO.upComment2(articleNO, upComment2, comment_id, comment_text);
//	}
	
}
