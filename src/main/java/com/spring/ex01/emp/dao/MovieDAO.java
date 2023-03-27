package com.spring.ex01.emp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MovieDTO;

@Repository
public class MovieDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * public List movieList() { List movieList =
	 * sqlSession.selectList("mapper.movie.movieList"); return movieList; }
	 * 
	 * // 醫뗭븘�슂 �뾽�뜲�씠�듃 public void update_Like(int articleNO){
	 * sqlSession.insert("mapper.movie.updateLike", articleNO); }
	 * 
	 * // 醫뗭븘�슂 異쒕젰 public int select_Like(int articleNO) { int like =
	 * sqlSession.selectOne("mapper.movie.selectLike", articleNO); return like; }
	 * 
	 * // articleNO 留욌뒗 �쁺�솕異쒕젰 public List viewArticle(int articleNO) { List list =
	 * sqlSession.selectList("mapper.movie.movieInfo", articleNO); return list; }
	 */
	
	
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
	
//	占쏙옙화 占쏙옙호占쏙옙 占승댐옙 占쏙옙화 占쏙옙占�
	public List viewArticle(int articleNO) {
		List list = sqlSession.selectList("mapper.movie.movieInfo", articleNO);
		return list;
	}
	
//	占쏙옙화 占쌩곤옙
	public void movieAdd(MovieDTO movieDTO) {
		sqlSession.selectList("mapper.movie.movieAdd", movieDTO);
	}
	
//	�쁺�솕 �궘�젣
	public void movieDelete(String title) {
		sqlSession.selectList("mapper.movie.movieDelete", title);
	}
	
//	�쁺�솕 �닔�젙
	public void movieUpdate(MovieDTO movieDTO) {
		sqlSession.update("mapper.movie.movieUpdate", movieDTO);
	}
	
//	占쏙옙占싣울옙 占쏙옙占쏙옙占쏙옙트
	public void update_Like(int articleNO){
		sqlSession.insert("mapper.movie.updateLike", articleNO);
	}
	
//	占쏙옙占싣울옙 占쏙옙占�
	public int select_Like(int articleNO) {
		int like = sqlSession.selectOne("mapper.movie.selectLike", articleNO);
		return like;
	}
	
//	�뙎湲� �엯�젰
	public void insertComment(MovieDTO movieDTO) {
		sqlSession.insert("mapper.movie.insertComment", movieDTO);
	}
	
//	�뙎湲� �엯�젰
	public void insertComment2(MovieDTO movieDTO) {
		sqlSession.insert("mapper.movie.insertComment2", movieDTO);
	}
	
//	�뙎湲� 異쒕젰(�럹�씠吏�)
	public List movieList(Map pagingMap) {
		List movieList = sqlSession.selectList("mapper.movie.commentList", pagingMap);
		return movieList;
	}
	
//	(�럹�씠吏� 湲곕뒫) �뙎湲� 媛쒖닔 援ы븯湲�
	public int selectTotArticles() {
		int tot = sqlSession.selectOne("mapper.movie.tot");
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

	
<<<<<<< HEAD

=======
	
	
>>>>>>> 9db47a466395473ca1a98cc330e1b8ddfbefde57
	
}

