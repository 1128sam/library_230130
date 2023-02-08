package com.library.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.common.EncryptUtils;
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

		String encryptPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByUserIdPassword(userId, encryptPassword);
		
		if (user != null) {
			// 세션에 유저 정보를 담는다.(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getUserId());
			session.setAttribute("userName", user.getName());	
			session.setAttribute("userId", user.getId());
			session.setAttribute("userType", user.getType());
//			session.setAttribute("userImageUrl", user.getImageUrl());
			
			// 행이 있으면 로그인
			result.put("code", 1);
			result.put("result", "successfully logged in");
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
		
		String encryptPassword = EncryptUtils.md5(password);
		int row = userBO.addUser(name, userId, encryptPassword, email);
		if (row == 1) {
			result.put("result", "success");
		} else {
			result.put("error", "등록 실패");
		}
		return result;
	}
	
	@GetMapping("/userId_validation")
	public Map<String, Object> userIdValidation(@RequestParam("userId") String userId) {
		Map<String, Object> result = new HashMap<>();
		int cnt = userBO.userIdValid(userId);

		if (cnt > 0) {
			result.put("result", "taken");
		} else {
			result.put("result", "available");
		}
		return result;
	}
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		return "redirect:/user/sign_in_view";
	}
	
	@GetMapping("/profile_update")
	public Map<String, Object> profileUpdate(
			@RequestParam("userId") String userId,
			@RequestParam("password") String password,
			@RequestParam("selfVerQue") String selfVerQue,
			@RequestParam("selfVerAns") String selfVerAns,
			@RequestParam("fileAttach") String fileAttach,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		int question = 0;
		String encryptPassword = EncryptUtils.md5(password);
		if (selfVerQue == "Volvo") {
			question = 1;
		}

		int row = userBO.updateUserProfile((int) session.getAttribute("userId"), userId, encryptPassword, question, selfVerAns, fileAttach);

		if (row >= 1) {
			result.put("code", 1);
			result.put("result", "successfully updated.");
		} else {
			result.put("code", 500);
			result.put("result", "fail");
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