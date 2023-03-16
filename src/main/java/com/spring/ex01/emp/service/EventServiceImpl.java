package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.EventDAO;

import com.spring.ex01.emp.dto.EventDTO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO edi;
	
	//이벤트 목록표시
	@Override
	public List getList() {
		List list = null;
		

		list = edi.selectEventList();
		
		
		return edi.selectEventList();
	}
	
	//이벤트 추가하기
	@Override
	public int addEvent(EventDTO dto) {
		
		return edi.insertEvent(dto);
		
	}
	
	
	
	//댓글 목록 표시
	@Override
	public List ListArticles() {
		List list = null;
		list = edi.ListArticles();
		return edi.ListArticles();
	}
	
	
}
