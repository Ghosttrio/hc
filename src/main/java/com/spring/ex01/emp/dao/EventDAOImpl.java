package com.spring.ex01.emp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

private static final Logger logger = LoggerFactory.getLogger(EventDAOImpl.class);
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectEventList() {

		logger.info("EventDAOImpl > selectEventList 호출");
		
		// SqlSession이 필요
		// SqlSession의 selectList 호출
		// selectList에서 sql 호출
		// 그 결과 DTO를 담은 List로 return 함
		List list = sqlSession.selectList("event.selectEventList");
		System.out.println("list.size : "+ list.size());
		logger.info("list.size : "+ list.size());
		
		return list;
	}
	
	@Override
	public List ListArticles() {
		
		logger.info("EventDAOImpl > ListArticles 호출");
		
		List list = sqlSession.selectList("event.listArticles");
		logger.info("list.size : "+ list.size());
		
		return list;
	}
}
