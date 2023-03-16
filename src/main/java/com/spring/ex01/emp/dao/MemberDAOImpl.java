package com.spring.ex01.emp.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MemberDTO;
import com.spring.ex01.emp.service.MemberService;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired	MemberService memberService;
	@Autowired	MemberDTO memberDTO;

	@Override
	public boolean loginDAO(String id, String pwd) {
		System.out.println("loginDAO 실행");
		boolean result = false;
		try {
           Connection con = dataFactory.getConnection();
           String query = "SELECT * FROM t_user WHERE id=? AND pwd=?";
           pstmt = con.prepareStatement(query);
           pstmt.setString(1, id);
           pstmt.setString(2, pwd);
           
           ResultSet rs = pstmt.executeQuery();
           	if(rs.next()){
           		result = true;
           	}
           pstmt.close();
           con.close();
           rs.close();
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return result;
	}

	@Override
	public void addUser(MemberDTO m) {
		try {
			Connection con = dataFactory.getConnection();
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			String query = "insert into t_user";
			query += " (id,pwd,name,email)";
			query += " values(?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate(); 
			//executeUpdate: 반환타입int, 데이터를 추가(Insert), 삭제(Delete), 수정(Update)하는 SQL 문을 실행
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MemberDTO> listUser() {
		System.out.println("UserDAO의 listUser를 실행함");
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			Connection con = dataFactory.getConnection();
			String query = "select * from t_user order by name desc";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				MemberDTO vo = new MemberDTO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println("UserDAO listUser 오류");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberDTO mypage(String id) {
		MemberDTO mypage = null;
		try {
			Connection con = dataFactory.getConnection();
			String query = "select * from t_user where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,id);
			System.out.println("mypage(select): " + query);
			ResultSet rs = pstmt.executeQuery(); //쿼리실행
			rs.next();
			String getId = rs.getString("id");
			String getPwd = rs.getString("pwd");
			String getName = rs.getString("name");
			String getEmail = rs.getString("email");
			mypage = new MemberDTO(getId, getPwd, getName, getEmail);
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println("UserDAO mypage 오류");
			e.printStackTrace();
		}
		return mypage;
	}

	@Override
	public void update(MemberDTO memberDTO) {
			String id = memberDTO.getId();
			String pwd = memberDTO.getPwd();
			String name = memberDTO.getName();
			String email = memberDTO.getEmail();
			try {
				con = dataFactory.getConnection();
				String query = "update t_user SET pwd=?, name=?, email=? where id=?";
				System.out.println("update 결과 값:" + query);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1,pwd);
				pstmt.setString(2,name);
				pstmt.setString(3,email);
				pstmt.setString(4,id);
				pstmt.executeUpdate();
				pstmt.close();
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(String id) {
		try {
			con = dataFactory.getConnection();
			String query = "delete from t_user where id=?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public boolean overlappedID(String id) {
		boolean result = false;
		try {
			con = dataFactory.getConnection();
			String query = "select decode(count(*),1,'true','false') as result from t_user";
			query += " where id=?";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}	
	
	

}
