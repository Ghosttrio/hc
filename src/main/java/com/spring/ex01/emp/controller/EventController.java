package com.spring.ex01.emp.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.EventDTO;
import com.spring.ex01.emp.dto.MemberDTO;
import com.spring.ex01.emp.dto.StoreDTO;
import com.spring.ex01.emp.service.EventService;



@Controller
public class EventController {
	

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	EventService eventService;
	
	//이벤트 목록 관리자용
	@RequestMapping(value="/event1/event1.do")
	public String getList(Model model) {
		List list = eventService.getList();
		
		
		model.addAttribute("eventsList", list);
		logger.warn("EventController > getList : list.size = "+ list.size());
		
		return "listEvent.sg";
		
	}
	
	//이벤트 목록 일반용
	@RequestMapping(value="/event1/event2.do")
	public String getList2(Model model) {
		List list = eventService.getList();
		
		model.addAttribute("eventsList", list);
		logger.warn("EventController > getList : list.size = "+ list.size());
		
		return "listEvent2.sg";
	}
	
	
	
	

	//이벤트 목록추가
	@RequestMapping(value="/addEventView.do", method=RequestMethod.POST)
	public String addEvent2(
			HttpServletRequest request,
			
			@ModelAttribute EventDTO dto
			) {
		
		
		System.out.println("Id : "+ dto.getId());
		
		// service 호출
		
		int name = eventService.addEvent(dto);
		System.out.println("insert 결과 : "+ name);
		
		return "redirect:/event1/event1.do";
	}
	

	
	//이벤트 목록 추가 창
	@RequestMapping(value="/addEvent.do", method=RequestMethod.GET)
	public String addEvent() {
		
		
		
		
		return "addEvent2.sg";
	}
	
	//두번째 이미지 보여주는 창
	@RequestMapping(value="/viewEvent.do")
	
	public String secondEvent(Model model,
			
			@RequestParam("id") 
			String id,
			HttpServletRequest request, HttpServletResponse response
			
			) throws UnsupportedEncodingException {
		
		//한글깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//이벤트 상세정보 가져오기
		List list = eventService.secondEvent(id);
		System.out.println(id);
		model.addAttribute("secondEvent", list);
		
		//이벤트 댓글목록 가져오기
		List list2 = eventService.ListArticles(id);
		
		model.addAttribute("listArticles", list2);
		logger.warn("EventController > getList : list.size = "+ list.size());
		
		return "viewEvent.sg";
	}
	
	//이벤트 수정창
	@RequestMapping(value="/modifyEvent2.do")
	public String modify(@ModelAttribute EventDTO dto) {
		System.out.println("modifyEvent2.do 실행:"+dto.getId());
		// DB에서 수정하고
		int count = eventService.updateEvent(dto);
		System.out.println("update 결과 : "+ count);
		
		
		return "redirect:/event1/event1.do"; //주소 고치기
	}
	
	//전체 수정삭제창
	@RequestMapping(value="/modifyEvent.do")
	public String modifyEvent(Model model) {
		
		List list = eventService.getList();
		
		model.addAttribute("eventsList", list);
		
		
		return "modify.sg";
	}
	
	
	@RequestMapping(value="/modifyEventForm.do")
	public String modifyEventForm(Model model) {
		
		

		return "modEventForm.sg";
	}
	
	//이벤트 삭제창
	@RequestMapping(value="/deleteEvent.do")
	public String deleteEvent(@ModelAttribute EventDTO dto) {
		System.out.println("deleteEvent.do 실행:"+dto.getId());
		// DB에서 수정하고
		int count = eventService.deleteEvent(dto);
		System.out.println("delete 결과 : "+ count);
		
		
		return "redirect:/event1/event1.do"; //주소 고치기
	}
	
	//댓글 관련 Controller
	
	
	//이벤트 댓글 목록
	@RequestMapping(value="/event1/listArticles.do")
	public String listArticlesView(Model model,
				@RequestParam(value="id", required=false) 
				String id
			) {
	
		
		
		List list = eventService.ListArticles(id);
		model.addAttribute("listArticles", list);
		logger.warn("EventController > ListArticles : list.size = "+ list.size());
		
		return "listArticles.sg2";
	}
	
	//댓글추가창
	@RequestMapping(value="/replyForm2.do")
	public String replyForm(
			HttpServletRequest request,
			
			@ModelAttribute EventDTO dto) {

		int name = eventService.replyForm(dto);
		System.out.println("insert 결과 : "+ name);
		System.out.println("getId()"+dto.getId());
//		return "redirect:/event1/event1.do";
		return "redirect:/viewEvent.do?id="+dto.getId();
	}
	
	//이벤트 댓글 추가 창
	@RequestMapping(value="/replyForm.do")
	public String replyForm2(Model model,@RequestParam("id") String id) {
		
		System.out.println("replyForm.do:id;"+id);
		
		model.addAttribute("id",id);
		return "articleForm.sg2";
	}
	
	//이벤트 대댓글 추가 창
	
	@RequestMapping(value="/addreply.do", method=RequestMethod.GET)
	public String addreply(Model model,
			@RequestParam("parentNO") String parentNO,
			@RequestParam("id") String id
			) {
		
		System.out.println("addreply.do 실행 :"+parentNO);
		System.out.println("addreply.do:parentNO"+parentNO);
		
		model.addAttribute("parentNO",parentNO);
		
		model.addAttribute("id",id);
		
		return "replyForm.sg2";
	}
//	@RequestMapping(value="/replyForm3.do")
//	public String replyForm3(Model model,@RequestParam("id") String id) {
//		
//		System.out.println("replyForm.do:id;"+id);
//		
//		model.addAttribute("id",id);
//		return "article/articleForm";
//	}
	

	
	//댓글 수정창
	@RequestMapping(value="/modArticle2.do")
	public String modArticle2(Model model,@ModelAttribute EventDTO dto,
			HttpServletRequest request, HttpServletResponse response) 
					throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		int list = eventService.modArticle(dto );
		System.out.println("dto.getreplyId :"+dto.getReplyId());
		
		model.addAttribute("dto", list);
		
		System.out.println("modArticle2.do 실행");
		return "redirect:/event1/listArticles.do";
	}
	

	
	//댓글 수정
	@RequestMapping(value="/modArticle.do")
	public String modArticle(
		
		@RequestParam("articleNO") String articleNO, Model model,
		HttpServletRequest request, HttpServletResponse response) 
				throws UnsupportedEncodingException {
			
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
			// DB에서 조회한
			EventDTO dto = eventService.selectReplyId(articleNO);
			System.out.println("articleNO :"+articleNO);
			// DTO를 메모리에 넣어서 jsp로 전달
			model.addAttribute("dto", dto);
			
			System.out.println("modArticle.do 실행");
			return "modArticle.sg2";
	}
	
	
//로그인 관련
	
//	@Controller
//	public class loginController {
////		아이디와 비밀번호를 입려받은 후 아이디가 admin일 경우 admin.jsp로 이동
////		아이디가 user일 경우 user.jsp로 이동
//		
////		-admin.jsp
////		-user.jsp
//		
//		@GetMapping("loginForm")
//		public String goLoginForm() {
//			return "Login.sg4";
//		}
		
//		@PostMapping("/login")
////		외부에서 전달받은 아이디와 패스워드를 매개변수로 받는다.
//		public String login(HttpServletRequest request,
//				Model model,
//				@RequestBody
//				EventDTO eventDTO,
//				@RequestParam("menu_id") String menu_id
//				) throws Exception  {
//			
//			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
////			만약 아아디가 admin일 경우
//			if ( memberDTO != null ) {
//				
//				String user_id = memberDTO.getMember_id();
//				if(user_id.equals("admin")) {
//					
//					return "admin.sg3";
//				}
////			만약 아이디가 admin이 아닐 경우  이동
//				return "user.sg3";
//			}
//			return menu_id;
//			}
//	}
//	
	@Controller
	public class loginController {
//		아이디와 비밀번호를 입려받은 후 아이디가 admin일 경우 admin.jsp로 이동
//		아이디가 user일 경우 user.jsp로 이동
		
//		-admin.jsp
//		-user.jsp
		
		@GetMapping("loginForm")
		public String goLoginForm() {
			return "login.sg3";
		}
		
		@RequestMapping("/login")
//		외부에서 전달받은 아이디와 패스워드를 매개변수로 받는다.
		public String login(HttpServletRequest request,
				Model model
				) throws Exception  {
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			if ( memberDTO != null ) {
			
				String user_id = memberDTO.getMember_id();
				System.out.println("user_id : " + user_id);
				//	만약 아아디가 admin일 경우
				if(user_id.equals("admin")) {
					
					return "admin.sg3";
				}
//			만약 아이디가 admin이 아닐 경우  이동
				return "user.sg3";
			}
			return "Login.sg4";
			}
	}
	
	//두번째 이미지 보여주는 창 admin 용
		@RequestMapping(value="/viewEvent2.do")
		
		public String secondEvent2(Model model,
				
				@RequestParam("id") 
				String id,
				HttpServletRequest request, HttpServletResponse response
				
				) throws UnsupportedEncodingException {
			
			//한글깨짐 방지
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			//이벤트 상세정보 가져오기
			List list = eventService.secondEvent(id);
			System.out.println(id);
			model.addAttribute("secondEvent", list);
			
			//이벤트 댓글목록 가져오기
			List list2 = eventService.ListArticles(id);
			
			model.addAttribute("listArticles", list2);
			logger.warn("EventController > getList : list.size = "+ list.size());
			
			return "viewEvent2.sg";
		}
	
}
