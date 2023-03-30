package com.spring.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.MovieDTO;

@Repository("movieDAO")
public class MovieDAOImpl implements MovieDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
//	영화 출력
	public List movieList() {
		List movieList = sqlSession.selectList("mapper.movie.movieList");
		return movieList;
	}
	
//	영화 출력 dto
	public MovieDTO movieList_dto() {
		MovieDTO movieList = sqlSession.selectOne("mapper.movie.movieList");
		return movieList;
	}
	
//	articleNO에 맞는 영화상세창 출력
	public List viewArticle(int articleNO) {
		List list = sqlSession.selectList("mapper.movie.movieInfo", articleNO);
		return list;
	}
	
//	영화 추가
	public void movieAdd(MovieDTO movieDTO) {
		sqlSession.selectList("mapper.movie.movieAdd", movieDTO);
	}
	
//	영화 삭제
	public void movieDelete(String title) {
		sqlSession.selectList("mapper.movie.movieDelete", title);
	}
	
//	영화 수정
	public void movieUpdate(MovieDTO movieDTO) {
		sqlSession.update("mapper.movie.movieUpdate", movieDTO);
	}
	
//	좋아요 반영
	public void update_Like(int articleNO){
		sqlSession.insert("mapper.movie.updateLike", articleNO);
	}
	
//	좋아요 출력
	public int select_Like(int articleNO) {
		int like = sqlSession.selectOne("mapper.movie.selectLike", articleNO);
		return like;
	}
	
//	댓글 추가
	public void insertComment(MovieDTO movieDTO) {
		sqlSession.insert("mapper.movie.insertComment", movieDTO);
	}
	
//	대댓글 추가
	public void insertComment2(MovieDTO movieDTO) {
		sqlSession.insert("mapper.movie.insertComment2", movieDTO);
	}

//	댓글 삭제
	public void deleteComment(int commentNO) {
		sqlSession.delete("mapper.movie.deleteComment", commentNO);
	}
	
//	댓글 출력
	public List movieList(Map pagingMap) {
		
		List movieList = sqlSession.selectList("mapper.movie.commentList", pagingMap);
		return movieList;
	}
	
//	부모 댓글 개수 출력
	public int selectTotArticles(Map pagingMap) {
		int tot = sqlSession.selectOne("mapper.movie.tot", pagingMap);
		return tot;
	}
	
//	극장 출력
	public List theaterList(){
		List list = sqlSession.selectList("mapper.movie.theaterList");
		return list;
	}
	
//	상영 정보 출력
	public List showList(){
		List list = sqlSession.selectList("mapper.movie.showList");
		return list;
	}
	
//	영화출력 오버라이드(예매)
	public List movieList(MovieDTO movieDTO) {
		List movieList = new ArrayList();
		movieList = sqlSession.selectList("mapper.movie.movieList", movieDTO);
		return movieList;
	}
	
//	극장출력 오버라이드(예매)
	public List theaterList(MovieDTO movieDTO) {
		List theaterList = new ArrayList();
		theaterList = sqlSession.selectList("mapper.movie.theaterList", movieDTO);
		return theaterList;
	}
	
//	상영정보출력 오버라이드(예매)
	public List showList(MovieDTO movieDTO) {
		List showList = sqlSession.selectList("mapper.movie.showList2", movieDTO);
		return showList;
	}
	
}

