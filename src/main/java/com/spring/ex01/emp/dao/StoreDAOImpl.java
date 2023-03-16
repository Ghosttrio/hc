package com.spring.ex01.emp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.StoreDTO;




@Repository
public class StoreDAOImpl implements StoreDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(StoreDAOImpl.class);


	@Autowired
	SqlSession sqlSession;
	
//	@Autowired
//	private StoreDAO storeDAO;
	
	@Autowired
	private StoreDTO storeDTO;
	
	
	// 관리자 페이지 (목록)
	@Override
	public List selectList() {
		System.out.println("StoreDAOImpl > selectList 호출");
		
		List list = sqlSession.selectList("mapper.store.StoreList");
		System.out.println("스토어 관리자(목록) list.size : " + list.size());
		logger.info("스토어 관리자(목록) list.size : " + list.size());
		return list;
	}
	
	// 관리자 페이지(추가)
	@Override
	public int StoreAdd(StoreDTO storeDTO) {
		System.out.println("StoreDAOImpl > StoreAdd 호출");
		
		int count = sqlSession.insert("mapper.store.StoreAdd", storeDTO);
		System.out.println(count);
		
//		List list = sqlSession.selectList("mapper.store.StoreAdd", storeDTO);
//		System.out.println("스토어 관리자(추가)list.size : " + list.size());
//		logger.info("스토어 관리자(추가)list.size : " + list.size());
		
		return count;
		
	}
	
	@Override
	public StoreDTO selectStore(String menu_id) {
		StoreDTO storeDTO = sqlSession.selectOne("mapper.store.selectStore", menu_id);
		return storeDTO;
	}
	
	
	@Override
	public int StoreUpdate(StoreDTO storeDTO) {
		int count = sqlSession.insert("mapper.store.StoreUpdate", storeDTO);
		
		System.out.println("StoreDAOImpl > StoreUpdate" + count);
		
		return count;
	}
	
	@Override
	public StoreDTO DeleteStore(String menu_id) {
		StoreDTO storeDTO = sqlSession.selectOne("mapper.store.DeleteStore", menu_id);
		return storeDTO;
	}
	
	@Override
	public StoreDTO selectMenu(String menu_type) {
		StoreDTO storeDTO = sqlSession.selectOne("mapper.store.selectMenu", menu_type);
		return storeDTO;
	}
	
	

}
