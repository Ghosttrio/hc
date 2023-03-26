package com.spring.ex01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex01.emp.dao.StoreDAO;
import com.spring.ex01.emp.dto.StoreDTO;






@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreDAO storeDAO;
	
	@Autowired
	StoreDTO storeDTO;
	
	// 메뉴 목록
	@Override
	public List getList() {
		
		List list = null;
		
		list = storeDAO.selectList();
		
		return storeDAO.selectList();
	}
	
//	@Override
//	 public void StoreAdd(StoreDTO storeDTO) {
//		
//		storeDAO.StoreAdd(storeDTO);
//
//	}

	// 메뉴 추가
	@Override
	public int StoreAdd(StoreDTO storeDTO) {
		
		return storeDAO.StoreAdd(storeDTO);
		
	}
	
	
//	@Override
//	public StoreDTO selectStore(String menu_id) {
//		StoreDTO storeDTO = sqlSession.selectOne("emp.selectEmp", empno);
//		return dto;
//	}
	@Override
	public StoreDTO selectStore(String menu_id) {
		
		StoreDTO storeDTO = storeDAO.selectStore(menu_id);
		
		return storeDTO;
	}
	
	
	// 메뉴 수정
	@Override
	public int StoreUpdate(StoreDTO storeDTO) {
		
		int count = storeDAO.StoreUpdate(storeDTO);
		
		System.out.println("StoreServiceImpl > StoreUpdate " + count);
		
		return count;
		
	}
	
	// 메뉴 삭제
	@Override
	public StoreDTO DeleteStore(String menu_id) {
		
		StoreDTO storeDTO = storeDAO.DeleteStore(menu_id);
		
		return storeDTO;
	}

	
	@Override
	public List selectMenu(String menu_type) {
		
		List selectMenu = storeDAO.selectMenu(menu_type);
		
		return selectMenu;
	}
	// 메뉴 정보창
	@Override
	public StoreDTO storeinfo(String menu_id) {
		
		StoreDTO storeDTO = storeDAO.storeinfo(menu_id);
		
		return storeDTO;
	}

	
	// 장바구니 추가
		@Override
		public int cartadd(StoreDTO storeDTO) {
			
			return storeDAO.cartadd(storeDTO);
			
		}
		
		
	// 장바구니 목록
	@Override
	public List cartlist(String cart_id) {
		
		List list = storeDAO.cartlist(cart_id);
		
		return list;
	}
	
	// 장바구니 중복 확인
	@Override
	public boolean findCart(StoreDTO storeDTO) {
		return storeDAO.selectCount(storeDTO);
	}
	
	// 장바구니 수량 수정
	@Override
	public int cart_update(StoreDTO storeDTO) {
		int count = storeDAO.cart_update(storeDTO);
		return count;
	}
	
}
