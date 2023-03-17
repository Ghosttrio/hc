package com.spring.ex01.emp.dao;

import java.util.List;


import com.spring.ex01.emp.dto.EventDTO;

public interface EventDAO {
	
	List selectEventList();
	List ListArticles();
	int insertEvent(EventDTO dto);
	List secondEvent(String id);
	public int updateEvent(EventDTO dto);
	public int deleteEvent(EventDTO dto);
	
}
