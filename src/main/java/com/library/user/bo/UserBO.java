package com.library.user.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.main.model.BookStatus;
import com.library.user.dao.UserDAO;
import com.library.user.model.User;

import jakarta.servlet.http.HttpSession;

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

	public List<User> getUserById(HttpSession session) {
		List<BookStatus> bsl = (List<BookStatus>) session.getAttribute("overdueBookStatusList");
		List<User> overdueUserList = new ArrayList<>();
		for (int i = 0; i < bsl.size(); i++) {
			overdueUserList.add(getUserListByUserId(bsl.get(i).getUserId()));
		}
		return overdueUserList;
//		return userDAO.selectUserInfoById(userId);
	}

	public User getUserInfoById(int userId) {
		return userDAO.selectUserInfoById(userId);
	}

	public User getUserListByUserId(int userId) {
		return userDAO.selectUserListByUserId(userId);
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