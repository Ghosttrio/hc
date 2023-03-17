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
		
		
		return list;
	}
	
	//이벤트 추가하기
	@Override
	public int addEvent(EventDTO dto) {
		
		return edi.insertEvent(dto);
		
	}
	
	//두번째 이벤트이미지 보여주기
	
	@Override
	public List secondEvent(String id) {
		List list = null;
		

		list = edi.secondEvent(id);
		
		
		return list;
	}
	
	//댓글 목록 표시
	@Override
	public List ListArticles() {
		List list = null;
		list = edi.ListArticles();
		return edi.ListArticles();
	}
	
	//이벤트 수정
	@Override
	public int updateEvent(EventDTO dto) {
		int count = edi.updateEvent(dto);
		return count;
	}
	
	//이벤트 삭제
	@Override
	public int deleteEvent(EventDTO dto) {
		int count = edi.deleteEvent(dto);
		return count;
	}
	
}
