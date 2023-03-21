package com.spring.ex01.emp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dto.EventDTO;
import com.spring.ex01.emp.service.EventService;



@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	EventService eventService;
	
	//이벤트 목록
	@RequestMapping(value="/event1/event1.do")
	public String getList(Model model) {
		List list = eventService.getList();
		
		model.addAttribute("eventsList", list);
		logger.warn("EventController > getList : list.size = "+ list.size());
		
		return "event/listEvent";
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
		
		
		
		
		return "event/addEvent2";
	}
	
	//두번째 이미지 보여주는 창
	@RequestMapping(value="/viewEvent.do")
	public String secondEvent(Model model,
			
			@RequestParam("id") 
			String id
			
			) {
		//이벤트 상세정보 가져오기
		List list = eventService.secondEvent(id);
		System.out.println(id);
		model.addAttribute("secondEvent", list);
		
		//이벤트 댓글목록 가져오기
		List list2 = eventService.ListArticles(id);
		
		model.addAttribute("listArticles", list2);
		logger.warn("EventController > getList : list.size = "+ list.size());
		
		return "event/viewEvent";
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
		
		
		return "event/modify";
	}
	
	
	@RequestMapping(value="/modifyEventForm.do")
	public String modifyEventForm(Model model) {
		
		

		return "event/modEventForm";
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
		
		return "article/listArticles";
	}
	
	//댓글추가창
	@RequestMapping(value="/replyForm2.do")
	public String replyForm(
			HttpServletRequest request,
			
			@ModelAttribute EventDTO dto
			
			) {

		
		
		// service 호출
		
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
		return "article/articleForm";
	}
	
	//댓글 수정창
	@RequestMapping(value="/modArticle2.do")
	public String modArticle2(Model model,@ModelAttribute EventDTO dto) {
		
		int list = eventService.modArticle(dto );
		
		model.addAttribute("dto", list);
		
		System.out.println("modArticle2.do 실행");
		return "redirect:/event1/listArticles.do";
	}
	
//	@RequestMapping(value="/detail.do")
//	public String detail(
//			
//			@RequestParam("replyId") String replyId, Model model) {
//		
//		// DB에서 조회한
//		EventDTO dto = eventService.selectReplyId(replyId);
//		
//		// DTO를 메모리에 넣어서 jsp로 전달
//		model.addAttribute("dto", dto);
//		
//		System.out.println("detail.do 실행");
//		return "article/modArticle";
//	}
	
	//댓글 수정
	@RequestMapping(value="/modArticle.do")
	public String modArticle(
		
		@RequestParam("articleNO") String articleNO, Model model) {
			
			// DB에서 조회한
			EventDTO dto = eventService.selectReplyId(articleNO);
			System.out.println("articleNO :"+articleNO);
			// DTO를 메모리에 넣어서 jsp로 전달
			model.addAttribute("dto", dto);
			
			System.out.println("modArticle.do 실행");
			return "article/modArticle";
	}
	
	//이벤트 댓글 추가
//	// 목록을 조회해서 json으로 돌려줌
//	@RequestMapping(value="/api/list", method=RequestMethod.GET)
//	@ResponseBody
//	public List list(Model model) {
//		List list = empService.getList();
//		
//		return list;
//	}
//	
//	@RequestMapping(value="/checkedList.do", method=RequestMethod.GET)
//	public String checkedList(Model model, 
//			HttpServletRequest request,
//			@RequestParam("chk") List<Integer> list_chk2,
//			@RequestParam("chk") String chk) {
//		
//		System.out.println("getParameterValues 결과");
//		String[] list_chk = request.getParameterValues("chk");
//		for(String val : list_chk) {
//			System.out.println(val);
//		}
//
//		System.out.println("@RequestParam 결과");
//		for(int val : list_chk2) {
//			System.out.println(val);
//		}
//		
//		System.out.println("chk : "+ chk);
//
//		List list = empService.selectCheckedList(list_chk);
//		
//		model.addAttribute("list", list);
//		logger.warn("EmpController > getList : list.size = "+ list.size());
//		
//		return "emp/list";
//	}
	
}
