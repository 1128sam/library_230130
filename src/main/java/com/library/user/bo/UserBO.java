package com.library.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.user.dao.UserDAO;
import com.library.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String name, String userId, String password, String email) {
		return userDAO.insertUser(name, userId, password, email);
	}
	
	public List<User> getUserList() {
		return userDAO.selectUserList();
	}
	
	public int userIdValid(String userId) {
		return userDAO.userIdValid(userId);
	}

	public User getUserByUserIdPassword(String userId, String password) {
		return userDAO.selectUserByUserIdPassword(userId, password);
	}
}