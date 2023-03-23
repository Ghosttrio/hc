package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ManagerDAO;

@Service
public class ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	public List selectMember() {
		List memberList = managerDAO.selectMember();
		return memberList;
	}
}
