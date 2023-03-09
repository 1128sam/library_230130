package com.library.user.bo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.FileManagerService;
import com.library.main.dao.BookDAO;
import com.library.main.model.BookStatus;
import com.library.user.dao.UserDAO;
import com.library.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private FileManagerService fms;

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

	public List<User> getUserByUserId2() {
		List<BookStatus> bsl = bookDAO.selectOverdueBookStatus(); // duedate passed bookstatuses
		List<User> overdueUserList = new ArrayList<>();
		for (int i = 0; i < bsl.size(); i++) {
			overdueUserList.add(getUserInfoById(bsl.get(i).getUserId()));
		}
		return overdueUserList;
	}

	public User getUserInfoById(int userId) {
		return userDAO.selectUserInfoById(userId);
	}

	public User getUserListByUserId(int userId) {
		return userDAO.selectUserListByUserId(userId);
	}

	public int updateUserProfile(int id, String userId, String password, int question, String selfVerAns, MultipartFile file) {
		String filePath = null;
		if (file != null) {
			// only when file exists => image path
			filePath = fms.saveFile(userId, file);
		}
		return userDAO.updateUserProfile(id, userId, password, question, selfVerAns, filePath);
	}

	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}

	public String getUserNameByUserId(int id) {
		return userDAO.selectUserNameByUserId(id);
	}
}