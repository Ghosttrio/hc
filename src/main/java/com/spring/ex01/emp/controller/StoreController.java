package com.spring.ex01.emp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/selectMenu.do")
	public String selectMenu(
	
		@RequestParam("menu_type") String menu_type, Model model) {
		
		StoreDTO storeDTO = storeService.selectMenu(menu_type);
	
	
		model.addAttribute("storeDTO", storeDTO);
		
		
		return "store/menu";
	}
	
	
	
	// 스토어 (장바구니)
	
	// 스토어 (선물하기)
	
	// 스토어 (구매하기)
	
	
	
}
