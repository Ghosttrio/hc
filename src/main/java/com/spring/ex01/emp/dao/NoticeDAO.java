package com.spring.ex01.emp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	
	// 고객센터
	// Service 에서 넘어온 값
	// 기본 화면 DAO 
	public List notice() {
		System.out.println("출력 : 기본 화면 : DAO ");
		List notice = new ArrayList();
		return notice;
	}
	
	// 공지사항
	// DB목록을 불러옴
	// Service에서 넘어온다
	public List selectnotice() {
		List list = sqlSession // SQL문을 호출 (SQL이나 트랜젝션 관리를 실행한다)
				    .selectList("mapper.noticeselect.selectnotice"); // noticeselect.xml의 namespace 값
		System.out.println("DB Select Notice Setting.... : DAO");
		System.out.println("공지사항 페이지에 접속했습니다 : DAO");
		return list;
		
	}
	// 1:1문의 페이지
	// Service에서 넘어온다
	public List selectqna() {
		List list = sqlSession.selectList("mapper.noticeselect.selectqna");
		System.out.println("DB Select FAQ Setting ....");
		System.out.println("1:1문의 페이지에 접속하셨습니다 : DAO");
		return list;
	}
	
	// 게시글 읽기 기능
	public List selectview() {
		List list = sqlSession.selectList("mapper.noticeselect.selectview");
		return list;
	}
	
	
	
	// 구현 안되는중
	// 글 등록하기 페이지 기능
	// Service에서 넘어온다
	public List insertwrite() {
		// SQL문 호출 xml에서 namespace 값 연결
		List list = sqlSession.selectList("mapper.noticeselect.insertwrite"); 
		
		System.out.println("DB Select InsertWrite Setting ....");
		System.out.println("글 등록하기 : DAO");
		
		return list;
	}
	
	// 삭제기능 구현하기 -> Service에서 넘어온다
	public List noticedelete() {
		List list = sqlSession.selectList("mapper.noticeselect.noticedelete");
		System.out.println("DB Select NoticeDelete Setting ....");
		System.out.println("글 삭제하기 : DAO");
		return list;
	}
	
	// 수정기능 구현하기 -> Service에서 넘어온다
	public List noticecorrection() {
		List list = sqlSession.selectList(null); // 아직 구현안됨
		System.out.println("DB Select NoticeCorrection Setting ....");
		System.out.println("글 수정하기 : DAO");
		return list;
	}

	
	
	
	
}
