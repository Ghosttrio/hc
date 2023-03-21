package com.spring.ex01.emp.service;

import java.util.List;


import com.spring.ex01.emp.dto.EventDTO;

public interface EventService {

	
	//이벤트 서비스
	List getList();
	int addEvent(EventDTO dto);
	List secondEvent(String id);
	public int updateEvent(EventDTO dto);
	public int deleteEvent(EventDTO dto);
	
	//댓글 서비스
	List ListArticles(String id);
	int replyForm(EventDTO dto);
	public int modArticle(EventDTO dto);
	EventDTO selectReplyId(String articleNO);
}
