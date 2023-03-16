package com.spring.ex01.emp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dao.StoreDAO;
import com.spring.ex01.emp.dto.StoreDTO;
import com.spring.ex01.emp.service.StoreService;



@Controller("StoreController")
@RequestMapping("/Store")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(Store_managerController.class);


	@Autowired
	private StoreService storeService;
	
	@Autowired
	private StoreDTO storeDTO;
	
	@Autowired
	private StoreDAO storeDAO;
	
	
	// 스토어 페이지 (메인)
	
	@RequestMapping("/storemain.do")
	public String storemain() {
		
		return "store/store";
	}
	
	
	// 스토어 (메뉴타입에 따라 출력)
	
	@RequestMapping(value = "/selectMenu.do", method=RequestMethod.GET)
	public String selectMenu(
	
		@RequestParam("menu_type") String menu_type, Model model) {
		
		List selectMenu = storeService.selectMenu(menu_type);
	
		model.addAttribute("selectMenu", selectMenu);
		logger.warn("StoreController > selectMenu : list.size = " + selectMenu.size());
		
		
		return "store/menu";
	}
	
	// 스토어 (정보 페이지)
	
	@RequestMapping("/storeinfo.do")
	public String storeinfo(
	
			@RequestParam("menu_id") String menu_id, Model model) {
		
//		List selectStore = null;
		
		// DB에서 조회한
		StoreDTO storeDTO = storeService.storeinfo(menu_id);
	
		// DTO를 메모리에 넣어서 jsp로 전달
		model.addAttribute("storeDTO", storeDTO);
		
		
		return "store/storeinfo";
	}
	
	
	
	
	// 스토어 (장바구니)
	
	// 스토어 (선물하기)
	
	// 스토어 (구매하기)
	
	
	
}
