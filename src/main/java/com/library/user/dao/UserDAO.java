package com.library.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(@Param("name") String name, 
			@Param("userId") String userId,
			@Param("password") String password,
			@Param("email") String email);

	public List<User> selectUserList();

	public int userIdValid(String userId);

	public User selectUserByUserIdPassword(@Param("userId") String userId, @Param("password") String password);

	public User selectUserInfoById(int userId);
}