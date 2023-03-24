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
	
<<<<<<< HEAD
	List cartlist();
	

=======
	List cartlist(String cart_id);

	boolean findCart(StoreDTO storeDTO);;
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
}
