package com.spring.ex01.emp.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ex01.emp.dao.NoticeDAO;
import com.spring.ex01.emp.dto.NoticeDTO;
@Service
public class NoticeService {

	@Autowired // 의존관계를 자동설정할 때 사용하며 타입을 이용하여 의존하는 객체를 삽입해 준다
	private NoticeDAO noticeDAO;

	
	
	
	// 고객센터 화면
	public List csc() {
		System.out.println("출력 : Service Select...");
		System.out.println("**********[Serviec Select : CSC]***********");
		
		List list = noticeDAO.notice(); // DAO에 메소드를 실행하고 그 결과를 list 변수에 담는다
		
		
		return list; // 의미를 모르겠음
	}
	
	// 리스트 출력 
	// Controller에서 넘어온다
	// 공지사항 
	public 
	List // 리턴타입
	listNotice() { // 스프링이 실행해 준다
		System.out.println("출력 : Service Select...");
		System.out.println("**********[Serviec Select : listNotice]***********");
		
		List list = noticeDAO.notice(); // DAO에 메소드를 실행하고 그 결과를 list 변수에 담는다
		
		list = noticeDAO.selectnotice(); // noticeselect.xml -> selectnotice 를 연결한다
		
		return list; // 의미를 모르겠음
	}
	
	// Controller 의 1:1문의 페이지
	public List qna() {
		System.out.println("1:1문의 사항 : Service");
		System.out.println("**********[Service Select : qna]***********");
		List list = noticeDAO.selectqna();
		list = noticeDAO.selectqna();
		return list;
	}
	
	
	
	// 등록하기 기능 
	public void write(NoticeDTO noticeDTO) {
		
		
	}
	
	// Controller 에서 넘어온다
//	public List addwrite() { // 스프링이 wtite를 실행
//		System.out.println("글 등록하기 : Service");
//		System.out.println("**********[Service Select : addwrite ]***********");
//		
//		List list = noticeDAO.insertwrite(); // DAO에 메소드를 실행하고 그 결과를 list 변수에 담는다 
//		list = noticeDAO.insertwrite(); // noticeselect.xml -> insertwrite 를 연결한다
//		return list; // 여기서의 리스트 의미를 모르겠음
//	}
	
	// 구현 안됨
	// 삭제기능 
	// Controller 에서 들어온다
	public List delete_e() {
		System.out.println("삭제기능이 진행됩니다 : Service");
		System.out.println("**********[Service Select : delete_e ]***********");
		List list = noticeDAO.notice();
		list = noticeDAO.noticedelete();
		return list;
	}
	
	// 구현 안됨
	// 수정기능 
	// Controller 에서 들어온다
	public List corr() {
		System.out.println("수정기능이 진행됩니다 : Service");
		System.out.println("**********[Service Select : corr ]***********");
		List list = noticeDAO.notice();
		list = noticeDAO.notice(); // 아직 xml에서 안가져옴
		return list;
	}

	

}
