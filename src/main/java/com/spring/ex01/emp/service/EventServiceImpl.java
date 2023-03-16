package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO edi;
	
	
	@Override
	public List getList() {
		List list = null;
		

		list = edi.selectEventList();
		
		
		return edi.selectEventList();
	}
	
	@Override
	public List ListArticles() {
		List list = null;
		list = edi.ListArticles();
		return edi.ListArticles();
	}
	
}
