package com.spring.ex01.emp.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.NoticeDTO;
import com.spring.ex01.emp.service.NoticeService;




@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	// @Autowired : 의존관계를 자동설정할 때 사용하며 타입을 이용하여 의존하는 객체를 삽입해 준다
	@Autowired NoticeService noticeService;
	
	// 메인화면 출력 !! -> 고객센터
	// @RequestMapping : 요청을 받는 형식을 정의
	@RequestMapping("/ntl")
	public String csc(
			HttpServletRequest request , // Http프로토콜의 request 정보를 서블릿에게 전달하기 위한 목적으로 사용
			HttpServletResponse response, // servlet은 HttpServletResponse 객체에 contentType,응답코드,응답메시지 등을 담아서 전송
			Model model
			) throws // 예외를 메소드의 사용자에게 전가하여 메소드는 기능에 집중하고, 사용자는 발생할 수 있는 예외를 미리 확인하고 처리 루틴을 설정해두기 위해 사용한다
	         UnsupportedEncodingException {
		System.out.println("출력 : MainCSC");
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		List list = noticeService.csc();
		model.addAttribute("csc",list); 
		// csc.jsp로 리턴 해준다
		return "csc";
	}
	
	// 이걸 사용한 이유를 까먹었다.....
	@RequestMapping(value="/listArtices.do" , method=RequestMethod.GET)
	public String notice(Model model,
			@RequestParam(value="noticeNo", required=false) int noticeNo,
			@RequestParam(value="d2",      required=false) String d2,
			@RequestParam(value="title",    required=false) String title,
			@RequestParam(value="writeDate",required=false) Date writeDate,
			@RequestParam(value="writer",   required=false) String writer,
			@RequestParam(value="cnt",      required=false) int cnt,
			@RequestParam(value="content",  required=false) String contnet) {
		System.out.println("게시판 목록 출력"+noticeNo+cnt+writer);
		model.addAttribute("a",noticeNo );

		return "notice";
	}	
		
	// 리스트가 출력됩니다
	// Service 로 넘어가는 값 
	@RequestMapping("/ln") // "/ln"=> 주소에 /ln을 적으면 스프링이 메소드 실행
	public // 접근제한자 : 다른 패키지에서도 사용가능 // private 내 클래스 안에서만 사용가능
	String // 리턴 타입 
	listNotice( // 스프링이 실행 해준다
			Model model // jsp로 값을 전달할때 사용한다
			) {
		// Model model 을 사용하는 이유
		// 
		List list = noticeService.listNotice(); // service에 메소드를 실행하고 결과를 list변수에 담는다
		// List list 를 사용하는 이유
		
		
		// 접근제한자 : 다른 패키지에서도 사용가능 // private 내 클래스 안에서만 사용가능
//		NoticeDTO n = new NoticeDTO();
//		n.d2 = "asd";
//		n.title = " vvv";
		
		
		model.addAttribute("ln", list); // list를 ln이라는 변수(키값)에 담아서 jsp로 보낸다
		// model.addAttributete 를 사용하는 이유
		
		System.out.println("list : "+list.size());
		System.out.println("**********[Front : select setting : Controller]***********");
	 
		// notice.jsp return
		return "notice";
	}
	
	// 글 읽기 구현
	

//	// 게시글 등록 화면을 호출 하는 곳
//	@RequestMapping("/addwrite") // addwrite 를 스프링이 실행
//	public String addwrite(Model model) { //jsp로 값을 전달할 때 사용하는 model
//		List list = noticeService.listNotice(); // service에 메소드를 실행하고 결과를 list변수에 담는다
//		model.addAttribute("addwrite",list); // model 은 jsp로 값을 전달한다
//		return "addwrite"; // addwrite.jsp
//	}	
//	// 게시글을 등록하는 기능을 하는 곳
//	@RequestMapping("/insertwrite") // /insertwrite -> 스프링이 실행해준다
//	public String insertwrtie(@ModelAttribute NoticeDTO dto) {		
//		noticeService.insertwrite(dto);		
//		return "notice"; // 게시판 리스트로 이동하게 된다
////		request.getParameter("title")	
//	}
	
	// 게시판 등록하기
	@RequestMapping(value="addwrite", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("noticeDTO", new NoticeDTO());
		return "addwrite";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(NoticeDTO noticeDTO, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "notice";
		}
		noticeService.write(noticeDTO);
		return "redirect:notice";
	}
	
	// 1:1문의 페이지 기능
	// qna.jsp 
	@RequestMapping("/qna")
	public String qna(Model model) {
		List list = noticeService.qna();
		model.addAttribute("qna", list);
		System.out.println("**********[FAQ : select setting : Controller]***********");
		System.out.println("출력 : 1:1 문의 문의 사항 : Controller ");
		System.out.println("list : "+list.size());
		return "qna";
	}
	
	// 삭제기능 추가
	// update.jsp 
	@RequestMapping("/update")
	public String deletenotice(Model model) {
		List list = noticeService.delete_e();
		model.addAttribute("deletenotice", list);
		System.out.println("**********[DeleteNotice : select setting : Controller]***********");
		System.out.println("출력 : 삭제를 진행합니다 : Controller ");
		System.out.println("list : "+list.size());
		return "deletenotice";
	}
	
	// 수정기능 추가
	// .jsp
	@RequestMapping("/edit")
	public String edit(Model model) {
		List list = noticeService.corr();
		model.addAttribute("correction",list);
		System.out.println("**********[Correction : select setting : Controller]***********");
		System.out.println("출력 : 수정을 진행합니다 : Controller ");
		System.out.println("list : "+list.size());
		return "correction";
	}
	
	
	
}
