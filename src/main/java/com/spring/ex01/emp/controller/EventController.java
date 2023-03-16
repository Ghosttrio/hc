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
	
	@RequestMapping(value="/addEvent.do", method=RequestMethod.GET)
	public String addEvent() {
		
		
		
		
		return "event/addEvent2";
	}
	
	
	//이벤트 댓글 목록
	@RequestMapping(value="/event1/listArticles.do", method=RequestMethod.GET)
	public String listArticlesView(Model model) {
		
		List list = eventService.ListArticles();
		model.addAttribute("listArticles", list);
		logger.warn("EventController > ListArticles : list.size = "+ list.size());
		
		return "article/listArticles";
	}
//	
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
