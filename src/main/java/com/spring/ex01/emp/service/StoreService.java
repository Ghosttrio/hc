package com.spring.ex01.emp.service;

import java.util.List;

import com.spring.ex01.emp.dto.StoreDTO;



public interface StoreService {
	
	List getList();
	
	int StoreAdd(StoreDTO storeDTO);
	
	
	int StoreUpdate(StoreDTO storeDTO);

	StoreDTO selectStore(String menu_id);

	StoreDTO DeleteStore(String menu_id);
	
	List selectMenu(String menu_type);
	
	StoreDTO storeinfo(String menu_id);
	
	int cartadd(StoreDTO storeDTO);
	
	List cartlist();
	

}
