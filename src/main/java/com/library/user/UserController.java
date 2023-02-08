package com.library.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.user.bo.UserBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	public UserBO userBO;
	
	// http://localhost:8080/user/sign_up_view
	@GetMapping("/sign_up_view")
	public String signUpView() {
		return "user/signUp";
	}

	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		return "user/signIn";
	}

	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		return "redirect:/user/sign_in_view";
	}

	@GetMapping("/user_profile_view")
	public String userProfileView(Model model, HttpSession session) {

		model.addAttribute("userId", (Integer) session.getAttribute("userId"));
		model.addAttribute("userLoginId", (String) session.getAttribute("userLoginId"));
		model.addAttribute("userName", (String) session.getAttribute("userName"));
		model.addAttribute("userType", (Integer) session.getAttribute("userType"));
		return "/user/userProfile";
	}

	@GetMapping("/profile_update_view")
	public String profileUpdateView(Model model, HttpSession session) {
		return "/user/profileUpdate";
	}
}