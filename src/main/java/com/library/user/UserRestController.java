package com.library.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.user.bo.UserBO;
import com.library.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();

		User user = userBO.getUserByUserIdPassword(userId, password);
		
		if (user != null) {
			// 행이 있으면 로그인
			result.put("code", 1);
			result.put("result", "성공");

			// 세션에 유저 정보를 담는다.(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getUserId());
			session.setAttribute("userType", user.getType());
			session.setAttribute("userImageUrl", user.getImageUrl());
			session.setAttribute("userName", user.getName());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "User does not exist.");
		}
		return result;
	}

	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("name") String name,
			@RequestParam("userId") String userId,
			@RequestParam("password") String password,
			@RequestParam("email") String email
			) {
		Map<String, Object> result = new HashMap<>();
		
		if (name == "") {
			result.put("result", "등록 실패");
			return result;
		}
		System.out.println(name + userId + password + email);
		
		int row = userBO.addUser(name, userId, password, email);
		if (row == 1) {
			result.put("result", "success");
		} else {
			result.put("error", "등록 실패");
		}
		return result;
	}
	
	@RequestMapping("/userId_validation")
	public Map<String, Object> userIdValidation(@RequestParam("userId") String userId) {
		Map<String, Object> result = new HashMap<>();
		int cnt = userBO.userIdValid(userId);

		if (cnt > 0) {
			result.put("result", "true");
		} else {
			result.put("result", "false");
		}
		return result;
	}
	/*
	 * LomBok
	 * 
	 * @NotBlank
	 * 
	 * @Size
	 * 
	 * on controller
	 * 
	 * 
	 * public enum Gender { MALE("male"), FEMALE("female");
	 * 
	 * @Getter private String sex;
	 * 
	 * Sex(String sex) { this.sex=sex; }
	 * 
	 * public void setSex(String sex) { this.sex=sex; } }
	 */
}