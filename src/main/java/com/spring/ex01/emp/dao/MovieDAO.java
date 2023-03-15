package com.spring.ex01.emp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MovieDTO;




@Repository("movieDAO")
public class MovieDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MovieDTO movieDTO;
	
//	��ȭ ���
	public List movieList() {
		List movieList = new ArrayList();
		movieList = sqlSession.selectList("mapper.member.movieList");
		return movieList;
	}
	
//	��ȭ ��ȣ�� �´� ��ȭ ���
	public List viewArticle(int articleNO) {
		List list = sqlSession.selectList("mapper.member.movieInfo", articleNO);
		return list;
	}
	
//	��ȭ �߰�
	public void movieAdd(MovieDTO movieDTO) {
		sqlSession.selectList("mapper.member.movieAdd", movieDTO);
	}
	
//	영화 삭제
	public void movieDelete(String title) {
		sqlSession.selectList("mapper.member.movieDelete", title);
	}
	
//	영화 수정
	public void movieUpdate(MovieDTO movieDTO) {
		sqlSession.update("mapper.member.movieUpdate", movieDTO);
	}
	
//	���ƿ� ������Ʈ
	public void update_Like(int articleNO){
		sqlSession.insert("mapper.member.updateLike", articleNO);
	}
	
//	���ƿ� ���
	public int select_Like(int articleNO) {
		int like = sqlSession.selectOne("mapper.member.selectLike", articleNO);
		return like;
	}
	
//	댓글 입력
	public void insertComment(MovieDTO movieDTO) {
		sqlSession.insert("mapper.member.insertComment", movieDTO);
	}
	
//	댓글 출력(페이징)
	public List movieList(Map pagingMap) {
		List movieList = sqlSession.selectList("mapper.member.commentList", pagingMap);
		return movieList;
	}
	
//	(페이징 기능) 댓글 개수 구하기
	public int selectTotArticles() {
		int tot = sqlSession.selectOne("mapper.member.tot");
		return tot;
	}
	
}
