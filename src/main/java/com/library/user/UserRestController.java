package com.library.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.EncryptUtils;
import com.library.main.bo.BookBO;
import com.library.main.model.BookStatus;
import com.library.user.bo.UserBO;
import com.library.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;
	@Autowired
	private BookBO bookBO;

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
			if (user.getImageUrl() != null || user.getImageUrl() != "") {
				session.setAttribute("userImageUrl", user.getImageUrl());
			}
			List<BookStatus> bsl = bookBO.getNotReturnedBookStatusByUserId(user.getId());
			if (bsl != null) {
				session.setAttribute("overdueBookStatusList", bsl);
			}

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
			@RequestParam("email") String email,
			@RequestParam("selfVerQue") String selfVerQue,
			@RequestParam("selfVerAns") String selfVerAns
			) {
		Map<String, Object> result = new HashMap<>();
		
		String encryptPassword = EncryptUtils.md5(password);
		int question = Integer.valueOf(selfVerQue.substring(3));
		int row = userBO.addUser(name, userId, encryptPassword, email, question, selfVerAns);
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

	@PostMapping("/profile_update")
	public Map<String, Object> profileUpdate(
			@RequestParam("userId") String userId,
			@RequestParam("password") String password,
			@RequestParam("selfVerQue") String selfVerQue,
			@RequestParam("selfVerAns") String selfVerAns,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		String encryptPassword = EncryptUtils.md5(password);
		int question = Integer.valueOf(selfVerQue.substring(3));

		int row = userBO.updateUserProfile((int) session.getAttribute("userId"), userId, encryptPassword, question, selfVerAns, file);

		if (row >= 1) {
			result.put("code", 1);
			result.put("result", "Successfully updated. Please sign in again.");
		} else {
			result.put("code", 500);
			result.put("result", "failed");
		}
		return result;
	}

	@GetMapping("/email_valid")
	public Map<String, Object> emailValid(@RequestParam("email") String email, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();

		User user = userBO.getUserByEmail(email);
		if (user != null) {
			int que = Integer.valueOf(user.getSelf_vertify_que());
			String question = "failed";
			if (que == 1) {
				question = "What is your father's name?";
			}
			session.setAttribute("question", question);
			session.setAttribute("answer", user.getSelf_vertify_ans());
			session.setAttribute("email", email);
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("result", "failed");
		}
		return result;
	}

	@GetMapping("/profile_update_view1")
	public Map<String, Object> profileUpdateView1(@RequestParam("email") String email, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();

		User user = userBO.getUserByEmail(email);
		String userId = user.getUserId();
		String userName = user.getName();
		String question = "volvo";
		String answer = user.getSelf_vertify_ans();

		session.setAttribute("email", email);
		session.setAttribute("userId", userId);
		session.setAttribute("userName", userName);
		session.setAttribute("question", question);
		session.setAttribute("answer", answer);
		result.put("code", 1);
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