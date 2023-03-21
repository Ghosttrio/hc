package com.spring.ex01.emp.dao;

import java.util.List;

import com.spring.ex01.emp.dto.StoreDTO;



public interface StoreDAO {

	public abstract List selectList();
	
	public int StoreAdd(StoreDTO storeDTO);
	
	StoreDTO selectStore(String menu_id);
	
	public int StoreUpdate(StoreDTO storeDTO);

	StoreDTO DeleteStore(String menu_id);
	
	public abstract List selectMenu(String menu_type);
	
	StoreDTO storeinfo(String menu_id);

	int cartadd(StoreDTO storeDTO);

	public abstract List cartlist();
	

	
}
