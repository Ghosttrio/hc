package com.spring.ex01.emp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.spring.ex01.emp.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {

private static final Logger logger = LoggerFactory.getLogger(EventDAOImpl.class);
	
	@Autowired
	SqlSession sqlSession;

	//이벤트 목록 
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
	
	//이벤트 목록 추가
	@Override
	public int insertEvent(EventDTO dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getTitle());
		System.out.println(dto.getFirstimage());
		System.out.println(dto.getSecondimage());
		System.out.println(dto.getEventday());
		int addEvent = sqlSession.insert("event.addEvent", dto);
		return addEvent;
	}
	
	//이벤트 두번째 이미지 표시
	@Override
	public List secondEvent(String id) {

		logger.info("EventDAOImpl > viewEvent 호출");
		
		// SqlSession이 필요
		// SqlSession의 selectList 호출
		// selectList에서 sql 호출
		// 그 결과 DTO를 담은 List로 return 함
		List list = sqlSession.selectList("event.viewEvent",id);
		System.out.println("list.size : "+ list.size());
		logger.info("list.size : "+ list.size());
		
		return list;
	}
	
	
	
	//이벤트 수정
	@Override
	public int updateEvent(EventDTO dto) {
		int count = sqlSession.update("event.updateEvent", dto);
		return count;
	}
	
	//이벤트 삭제
	@Override
	public int deleteEvent(EventDTO dto) {
		int count = sqlSession.update("event.deleteEvent", dto);
		return count;
	}
	
	
	//댓글
	
	
	//이벤트 댓글 표시
	@Override
	public List ListArticles() {
		
		logger.info("EventDAOImpl > ListArticles 호출");
		
		List list = sqlSession.selectList("event.listArticles");
		logger.info("list.size : "+ list.size());
		
		return list;
	}
	
	//댓글 추가
	//이벤트 목록 추가
		@Override
		public int insertReplyForm(EventDTO dto) {
			
			System.out.println("getArticleNO:"+dto.getArticleNO());
			System.out.println("getParentNO:"+dto.getParentNO());
			System.out.println("getReplyTitle:"+dto.getReplyTitle());
			System.out.println("getContent:"+dto.getContent());
			System.out.println("getReplyId:"+dto.getReplyId());
			System.out.println("getWriteDate:"+dto.getWriteDate());
			int ReplyForm = sqlSession.insert("event.ReplyForm", dto);
			return ReplyForm;
		}
	
		//댓글 수정
		@Override
		public int modArticle(EventDTO dto) {
			int count = sqlSession.update("event.modArticle", dto);
			return count;
		}
		
		@Override
		public EventDTO selectReplyId(String replyId) {
			EventDTO dto = sqlSession.selectOne("event.selectReplyId", replyId);
			return dto;
		}
}
