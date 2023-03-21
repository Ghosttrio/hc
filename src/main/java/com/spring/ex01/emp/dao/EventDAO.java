package com.spring.ex01.emp.dao;

import java.util.List;


import com.spring.ex01.emp.dto.EventDTO;

public interface EventDAO {
	
	List selectEventList();
	int insertEvent(EventDTO dto);
	List secondEvent(String id);
	public int updateEvent(EventDTO dto);
	public int deleteEvent(EventDTO dto);
	
	
	List ListArticles(String id);
	int insertReplyForm(EventDTO dto);
	public int modArticle(EventDTO dto);
	EventDTO selectReplyId(String replyId);
}
