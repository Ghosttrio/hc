package com.spring.ex01.emp.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex01.emp.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired	private SqlSession sqlSession;	

	@Override	//로그인(loginMember)
	public MemberDTO loginMember(MemberDTO memberDTO) throws DataAccessException {
		System.out.println("loginMember: "+memberDTO);
			MemberDTO member = (MemberDTO) sqlSession.selectOne("mapper.member.loginMember",memberDTO);
			//*selectOne: Id, pwd를 한줄로 돌려준다,  selectList: 리스트로 돌려준다.
			System.out.println("after: "+member);
			return member;
		}

	@Override	//회원가입(addMember)
	public void addMember(MemberDTO memberDTO) {
		sqlSession.insert("mapper.member.addMember",memberDTO);
	}
	
	
	@Override 	//회원 중복확인(checkMember)
	public String  checkMember(String id) throws DataAccessException{
		System.out.println("checkmember Id: "+id);
		String result =  sqlSession.selectOne("mapper.member.checkMember",id);
		return result;
	}	
	

//	@Override	//관리자페이지 회원리스트 (listMember) <보류>
//	public List<MemberDTO> listUser() {
//		System.out.println("UserDAO의 listUser를 실행함");
//		List<MemberDTO> list = new ArrayList<MemberDTO>();
//		try {
//			Connection con = dataFactory.getConnection();
//			String query = "select * from t_user order by name desc";
//			System.out.println("prepareStatememt: " + query);
//			pstmt = con.prepareStatement(query);
//			ResultSet rs = pstmt.executeQuery();
//			while (rs.next()) {
//				String id = rs.getString("id");
//				String pwd = rs.getString("pwd");
//				String name = rs.getString("name");
//				String email = rs.getString("email");
//				MemberDTO vo = new MemberDTO();
//				vo.setId(id);
//				vo.setPwd(pwd);
//				vo.setName(name);
//				vo.setEmail(email);
//				list.add(vo);
//			}
//			rs.close();
//			pstmt.close();
//			con.close();
//		} catch (Exception e) {
//			System.out.println("UserDAO listUser 오류");
//			e.printStackTrace();
//		}
//		return list;
//	}

//	@Override	//마이페이지 출력(mainMypage)
//	public MemberDTO mainMypage(String id) {
//		MemberDTO mypage = null;
//		try {
//			Connection con = dataFactory.getConnection();
//			String query = "select * from t_user where id=?";
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1,id);
//			System.out.println("mypage(select): " + query);
//			ResultSet rs = pstmt.executeQuery(); //쿼리실행
//			rs.next();
//			String getId = rs.getString("id");
//			String getPwd = rs.getString("pwd");
//			String getName = rs.getString("name");
//			String getEmail = rs.getString("email");
//			mypage = new MemberDTO(getId, getPwd, getName, getEmail);
//			rs.close();
//			pstmt.close();
//			con.close();
//		} catch (Exception e) {
//			System.out.println("UserDAO mypage 오류");
//			e.printStackTrace();
//		}
//		return mypage;
//	}
	

//	@Override	//마이페이지 회원 정보 수정(updateMypage)
//	public void updateMypage(MemberDTO memberDTO) {
//			String id = memberDTO.getId();
//			String pwd = memberDTO.getPwd();
//			String name = memberDTO.getName();
//			String email = memberDTO.getEmail();
//			try {
//				con = dataFactory.getConnection();
//				String query = "update t_user SET pwd=?, name=?, email=? where id=?";
//				System.out.println("update 결과 값:" + query);
//				pstmt = con.prepareStatement(query);
//				pstmt.setString(1,member_pwd);
//				pstmt.setString(2,name);
//				pstmt.setString(3,email);
//				pstmt.setString(4,id);
//				pstmt.executeUpdate();
//				pstmt.close();
//				con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
	
//	@Override	//마이페이지 회원탈퇴(delMember)
//	public void delMember(String id) throws Exception {
//		sqlSession.delete("member.memberDelete", id);
//	}

	//마이페이지 영화 예매내역 출력(movieMypage) <보류>
//	public void movieMypage();

	//마이페이지 스토어 구매내역 출력(stroreMypage) <보류>
//	public void stroreMypage();




	
	

}
