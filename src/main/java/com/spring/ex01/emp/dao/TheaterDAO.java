package com.spring.ex01.emp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MovieDTO;
import com.spring.ex01.emp.dto.TheaterDTO;

@Repository
public class TheaterDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	�� ���� ���
	public List showList(){
		List list = sqlSession.selectList("mapper.theater.showList");
		return list;
	}
//	���� ���
	public List theaterList(){
		List list = sqlSession.selectList("mapper.theater.theaterList");
		return list;
	}
	
	
	
//	��ȭ��� �������̵�(����)
	public List movieList(MovieDTO movieDTO) {
		List movieList = new ArrayList();
		movieList = sqlSession.selectList("mapper.movie.movieList", movieDTO);
		return movieList;
	}
	
//	������� �������̵�(����)
	public List theaterList(TheaterDTO theaterDTO) {
		List theaterList = new ArrayList();
		theaterList = sqlSession.selectList("mapper.theater.theaterList", theaterDTO);
		return theaterList;
	}
//	��������� �������̵�(����)
	public List showList(TheaterDTO theaterDTO) {
		List showList = sqlSession.selectList("mapper.theater.showList2", theaterDTO);
		return showList;
	}
	
}
