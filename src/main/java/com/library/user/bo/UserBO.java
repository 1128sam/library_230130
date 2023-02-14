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

	public User getUserInfoById(int userId) {
		return userDAO.selectUserInfoById(userId);
	}

	public int updateUserProfile(int id, String userId, String password, int question, String selfVerAns, String fileAttach) {
		return userDAO.updateUserProfile(id, userId, password, question, selfVerAns, fileAttach);
	}

	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}

	public String getUserNameByUserId(int id) {
		return userDAO.selectUserNameByUserId(id);
	}
}