package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.LoginDTO;

@Repository("loginDAO")
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
//	회원추가
	public void memberInsert(LoginDTO loginDTO) {
		sqlSession.insert("mapper.login.memberInsert", loginDTO);
	}
//	회원조회
	public List memberList(LoginDTO loginDTO) {
		List memberList = sqlSession.selectList("mapper.login.memberList", loginDTO);
		return memberList;
	}
	
	
}
