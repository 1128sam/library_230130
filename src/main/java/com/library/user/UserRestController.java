package com.library.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;

	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("name") String name,
			@RequestParam("userId") String userId,
			@RequestParam("password") String password,
			@RequestParam("email") String email
			) {
		Map<String, Object> result = new HashMap<>();
		
		int row = userBO.addUser(name, userId, password, email);
		if (row == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "등록 실패");
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