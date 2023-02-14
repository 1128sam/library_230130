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

	public int updateUserProfile(
			@Param("id") int id,
			@Param("userId") String userId,
			@Param("password") String password,
			@Param("question") int question,
			@Param("selfVerAns") String selfVerAns,
			@Param("fileAttach") String fileAttach);

	public User selectUserByEmail(String email);

	public String selectUserNameByUserId(int id);
}