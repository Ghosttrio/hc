package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.LoginDTO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List selectMember() {
		List memberList = sqlSession.selectList("mapper.manager.memberList");
		return memberList;
	}
	
	
}
