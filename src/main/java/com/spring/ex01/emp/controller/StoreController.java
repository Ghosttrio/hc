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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex01.emp.dao.StoreDAO;
import com.spring.ex01.emp.dto.MemberDTO;
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
		System.out.println("/storemain.do");
		return "storemain";
	}
	
	
	// 스토어 (메뉴타입에 따라 출력)
	
	@RequestMapping(value = "/selectMenu.do", method=RequestMethod.GET)
	public String selectMenu(
	
		@RequestParam("menu_type") String menu_type, Model model) {
		
		List selectMenu = storeService.selectMenu(menu_type);
	
		model.addAttribute("selectMenu", selectMenu);
		
		model.addAttribute("menu_type", menu_type);
	
		
		logger.warn("StoreController > selectMenu : list.size = " + selectMenu.size());
		logger.warn("StoreController > type : menu_type = " + menu_type);
		
		
		return "storemenu";
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
		
		
		return "storeinfo";
	}
	
	// 스토어 (장바구니 추가)
		@ResponseBody
		@RequestMapping(value = "/cartadd.do" , method= {RequestMethod.GET, RequestMethod.POST})
		public String cartadd(
				HttpServletRequest request,
				Model model,
				@ModelAttribute 
				StoreDTO storeDTO
				)throws Exception  {
		
			
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			
			if ( memberDTO != null ) {
				
				String user_id = memberDTO.getMember_id();
				String menu_id = storeDTO.getMenu_id();
				System.out.println("user_id : " + user_id);
				System.out.println("menu_id : " + menu_id);
			
				
				// 로그인 되어 있음
				if (user_id != null && user_id != "") {
				
					// 장바구니 결제여부 "N"
					storeDTO.setStore_pay("N");
					// cart_id 저장
					storeDTO.setCart_id("cart_" + user_id);
					// user_id 저장
					storeDTO.setUser_id(user_id);
					
					int count = storeService.cartadd(storeDTO);
					 System.out.println("insert결과 : " + count);
					 
					 // 장바구니에 담김 보실?
					 // ㅇㅇ
					 
					 return "cartlist";
					 
				 // ㄴㄴ
				 // 정보창
				 
				}
			
			} 
				
				return "login";

		}
		
	// 스토어 (장바구니 목록)
		@RequestMapping(value = "/cartlist.do" , method= {RequestMethod.GET, RequestMethod.POST})
		public String cartlist(
				@RequestParam("user_id") String user_id,
				@RequestParam("menu_id") String menu_id,
				Model model) {
				
				List cartlist = storeService.cartlist();
				
				model.addAttribute("cartlist", cartlist);
				
				logger.warn("StoreController > cartlist : cartlist.size = " + cartlist.size());
				
				// 장바구니에 메뉴가 담겼습니다
				
				
				return "storecart";	
		}
	
	
	
	
	
	
	
	
	
	
	// 스토어 (구매하기)
	
	
	
}
