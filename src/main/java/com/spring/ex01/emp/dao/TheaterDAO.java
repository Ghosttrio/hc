package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.MovieDTO;
import dto.TheaterDTO;

@Repository
public class TheaterDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	상영 정보 출력
	public List showList(){
		List list = sqlSession.selectList("mapper.theater.showList");
		return list;
	}
//	극장 출력
	public List theaterList(){
		List list = sqlSession.selectList("mapper.theater.theaterList");
		return list;
	}
	
	
	
//	영화출력 오버라이드(예매)
	public List movieList(MovieDTO movieDTO) {
		List movieList = new ArrayList();
		movieList = sqlSession.selectList("mapper.movie.movieList", movieDTO);
		return movieList;
	}
	
//	극장출력 오버라이드(예매)
	public List theaterList(TheaterDTO theaterDTO) {
		List theaterList = new ArrayList();
		theaterList = sqlSession.selectList("mapper.theater.theaterList", theaterDTO);
		return theaterList;
	}
//	상영정보출력 오버라이드(예매)
	public List showList(TheaterDTO theaterDTO) {
		List showList = sqlSession.selectList("mapper.theater.showList2", theaterDTO);
		return showList;
	}
	
}
