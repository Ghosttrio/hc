package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MovieDAOImpl;
import com.spring.dto.MovieDTO;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieDAOImpl movieDAO;
	
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
	
//	articleNO에 맞는 영화정보
	public List viewArticle(int articleNO) {
		List article = movieDAO.viewArticle(articleNO);
		return article;
	}
	
//	영화 추가
	public void add(MovieDTO movieDTO) {
		movieDAO.movieAdd(movieDTO);
	}
	
//	영화 수정
	public void up(MovieDTO movieDTO) {
		movieDAO.movieUpdate(movieDTO);
	}
	
//	영화삭제
	public void del(String title) {
		movieDAO.movieDelete(title);
	}
	
//	좋아요 수정
	public void updateLike(int articleNO) {
		movieDAO.update_Like(articleNO);
	}
	
//	좋아요 출력
	public int selectLike(int articleNO) {
		int like = movieDAO.select_Like(articleNO);
		return like;
	}
	
//	댓글 추가
	public void insertComment(MovieDTO movieDTO) {
		movieDAO.insertComment(movieDTO);
	}
	
//	대댓글 추가
	public void insertComment2(MovieDTO movieDTO) {
		movieDAO.insertComment2(movieDTO);
	}
	
//	댓글 삭제
	public void deleteComment(int commentNO) {
		movieDAO.deleteComment(commentNO);
	}
	
//	댓글 출력
	public Map commentList(Map pagingMap) {
		Map articlesMap = new HashMap();
		List articlesList = movieDAO.movieList(pagingMap);
		int totArticles = movieDAO.selectTotArticles(pagingMap);
//		섹션, 페이징에 맞는 댓글리스트 출력
		articlesMap.put("articlesList", articlesList);
//		댓글 총개수 출력 --> 부모댓글의 총개수 출력으로 변경하기
		articlesMap.put("totArticles", totArticles);
		return articlesMap;
	}
	
//	상영 정보 출력 관련
	public List theaterList() {
		List theaterList = movieDAO.theaterList();
		return theaterList;
	}
	public List showList() {
		List showList = movieDAO.showList();
		return showList;
	}
	
//	영화, 극장 리스트
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
	
	
}
