package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.dto.MovieDTO;

public interface MovieDAO {
	
//	영화 출력
	public List movieList();
	
//	영화 출력 dto
	public MovieDTO movieList_dto();
	
//	articleNO에 맞는 영화상세창 출력
	public List viewArticle(int articleNO);
	
//	영화 추가
	public void movieAdd(MovieDTO movieDTO); 
	
//	영화 삭제
	public void movieDelete(String title);
	
//	영화 수정
	public void movieUpdate(MovieDTO movieDTO);
	
//	좋아요 반영
	public void update_Like(int articleNO);
	
//	좋아요 출력
	public int select_Like(int articleNO); 
	
//	댓글 추가
	public void insertComment(MovieDTO movieDTO);
	
//	대댓글 추가
	public void insertComment2(MovieDTO movieDTO);

//	댓글 삭제
	public void deleteComment(int commentNO);
	
//	댓글 출력
	public List movieList(Map pagingMap);
	
//	부모 댓글 개수 출력
	public int selectTotArticles(Map pagingMap);
	
//	극장 출력
	public List theaterList();
	
//	상영 정보 출력
	public List showList();
	
//	영화출력 오버라이드(예매)
	public List movieList(MovieDTO movieDTO);
	
//	극장출력 오버라이드(예매)
	public List theaterList(MovieDTO movieDTO); 
	
//	상영정보출력 오버라이드(예매)
	public List showList(MovieDTO movieDTO); 
}
