package com.spring.ex01.emp.service;

import java.util.List;

import com.spring.ex01.emp.dto.NoticeDTO;

public interface NoticeService1 {

	public abstract List<NoticeDTO> list();
	
	public abstract void write(NoticeDTO noticeVO);
}
