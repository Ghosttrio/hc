package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.dto.MovieDTO;

public interface MovieService {
//	영화 출력
	public List movieList();
	
//	영화 출력 dto
	public MovieDTO movieList_dto();
	
//	articleNO에 맞는 영화정보
	public List viewArticle(int articleNO);
	
//	영화 추가
	public void add(MovieDTO movieDTO);
	
//	영화 수정
	public void up(MovieDTO movieDTO);
	
//	영화삭제
	public void del(String title);
	
//	좋아요 수정
	public void updateLike(int articleNO);
	
//	좋아요 출력
	public int selectLike(int articleNO);
	
//	댓글 추가
	public void insertComment(MovieDTO movieDTO);
	
//	대댓글 추가
	public void insertComment2(MovieDTO movieDTO);
	
//	댓글 삭제
	public void deleteComment(int commentNO);
	
//	댓글 출력
	public Map commentList(Map pagingMap);
	
//	상영 정보 출력 관련
	public List theaterList();
	public List showList();
	public List movieList(MovieDTO movieDTO);
	public List theaterList(MovieDTO movieDTO);
	public List showList(MovieDTO movieDTO);
	
}
