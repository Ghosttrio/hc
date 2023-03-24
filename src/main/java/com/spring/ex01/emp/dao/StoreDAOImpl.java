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
	
	// 메뉴 수정
	@Override
	public int StoreUpdate(StoreDTO storeDTO) {
		int count = sqlSession.insert("mapper.store.StoreUpdate", storeDTO);
		
		System.out.println("StoreDAOImpl > StoreUpdate" + count);
		
		return count;
	}
	
	// 메뉴 삭제
	@Override
	public StoreDTO DeleteStore(String menu_id) {
		StoreDTO storeDTO = sqlSession.selectOne("mapper.store.DeleteStore", menu_id);
		return storeDTO;
	}
	
	
	// 메뉴타입에 따라 출력
	@Override
	public List selectMenu(String menu_type) {
		List selectMenu = sqlSession.selectList("mapper.store.selectMenu", menu_type);
		
		System.out.println("메뉴타입에 따라 출력 list.size : " + selectMenu.size());
		logger.info("메뉴타입에 따라 출력 list.size : " + selectMenu.size());
		return selectMenu;
	}
	
	// 메뉴 정보
	@Override
	public StoreDTO storeinfo(String menu_id) {
		StoreDTO storeDTO = sqlSession.selectOne("mapper.store.storeinfo", menu_id);
		return storeDTO;
	}
	
	// 스토어(장바구니 목록)
		@Override
		public List cartlist(String cart_id) {
			System.out.println("StoreDAOImpl > cartlist 호출");
			
			List list = sqlSession.selectList("mapper.store.cartlist", cart_id);
			System.out.println("스토어(장바구니 목록) list.size : " + list.size());
			logger.info("스토어 관리자(목록) list.size : " + list.size());
			return list;
		}
	
	// 장바구니 추가
	@Override
	public int cartadd(StoreDTO storeDTO) {
		System.out.println("StoreDAOImpl > cartadd 호출");
		
		int count = sqlSession.insert("mapper.store.cartadd", storeDTO);
		System.out.println(count);
		
	
		return count;
		
	}
	
	// 장바구니 중복 확인
	public boolean selectCount(StoreDTO storeDTO) {
		System.out.println("StoreDAOImpl > selectCount 호출");
		String result = sqlSession.selectOne("mapper.store.selectCount", storeDTO);
		return Boolean.parseBoolean(result);
	}
	

}
