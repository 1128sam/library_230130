package com.library.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@GetMapping("/add_book_view")
	public String addBookView(HttpSession session, Model model) {
		model.addAttribute("viewName", "book/addBook");
		return "template/layout";
	}
}