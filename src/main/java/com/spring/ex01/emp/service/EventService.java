package com.spring.ex01.emp.service;

import java.util.List;

import com.spring.ex01.emp.dto.EventDTO;

public interface EventService {

	List getList();
	List ListArticles();
	
	int addEvent(EventDTO dto);
}
