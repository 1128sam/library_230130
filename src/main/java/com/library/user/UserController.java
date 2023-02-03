package com.library.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	@GetMapping("/sign_up_view")
	public String signUpView() {
		return "user/signUp";
	}

	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		return "user/signIn";
	}
}