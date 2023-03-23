package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.LoginDTO;
import service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private LoginDTO loginDTO;
	
	@RequestMapping(value="/manager.do", method=RequestMethod.GET)
	public String manager() {
		System.out.println("관리자페이지실행");
		return "manager/manager";
	}
	
	@RequestMapping(value="/memberManager.do", method=RequestMethod.GET)
	public String memberManager(Model model) {
		System.out.println("회원관리실행");
		List memberList = managerService.selectMember();
		model.addAttribute("memberList",memberList);
		return "manager/memberManager";
	}
	
	@RequestMapping(value="/movieManager.do", method=RequestMethod.GET)
	public String movieManager() {
		System.out.println("영화관리실행");
		return "manager/movieManager";
	}
	
	@RequestMapping(value="/theaterManager.do", method=RequestMethod.GET)
	public String theaterManager() {
		System.out.println("극장관리실행");
		return "manager/theaterManager";
	}
}
