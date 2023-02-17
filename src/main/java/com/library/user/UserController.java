package com.library.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.main.Book;
import com.library.main.bo.BookBO;
import com.library.user.bo.UserBO;
import com.library.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	public UserBO userBO;
	@Autowired
	public BookBO bookBO;
	
	// http://localhost:8080/user/sign_up_view
	@GetMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}

	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
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
		// userId1 is used for calling bookLists that are currently borrowed
		int userId1 = (Integer) session.getAttribute("userId");
		List<Integer> borrowedBookIdList = bookBO.getBookIdListByUserId(userId1, 0);
		List<Book> borrowedBookList = new ArrayList<>();
		List<Date> dueDateList = new ArrayList<>();
		for (int i = 0; i < borrowedBookIdList.size(); i++) {
			borrowedBookList.add(bookBO.getBookByBookId(borrowedBookIdList.get(i)));
			dueDateList.add(bookBO.getDueDateByBookId(userId1, borrowedBookIdList.get(i)));
		}
		model.addAttribute("borrowedBookList", borrowedBookList);
		model.addAttribute("dueDateList", dueDateList);

		// userId2 is used for calling bookLists that are returned
		int userId2 = (Integer) session.getAttribute("userId");
		List<Integer> returnedBookIdList = bookBO.getBookIdListByUserId(0, userId2);
		List<Book> returnedBookList = new ArrayList<>();
		for (int i = 0; i < returnedBookIdList.size(); i++) {
			returnedBookList.add(bookBO.getBookByBookId(returnedBookIdList.get(i)));
		}
		model.addAttribute("returnedBookList", returnedBookList);

		model.addAttribute("userId", (Integer) session.getAttribute("userId"));
		model.addAttribute("userLoginId", (String) session.getAttribute("userLoginId"));
		model.addAttribute("userName", (String) session.getAttribute("userName"));
		model.addAttribute("userType", (Integer) session.getAttribute("userType"));
		model.addAttribute("viewName", "user/userProfile");
		return "template/layout";
	}

	@GetMapping("/profile_update_view")
	public String profileUpdateView(Model model, HttpSession session) {
		model.addAttribute("viewName", "user/profileUpdate");
		return "template/layout";
	}
	
	@GetMapping("/email_validation_view")
	public String emailValidView(Model model) {
		model.addAttribute("viewName", "user/emailValid");
		return "template/layout";
	}

	@GetMapping("/account_restore_view")
	public String accountRestoreView(Model model) {
		model.addAttribute("viewName", "user/accountRestore");
		return "template/layout";
	}

	@GetMapping("/profile_update_view0")
	public String profileUpdateView1(Model model, @RequestParam("email") String email) {
		User user = userBO.getUserByEmail(email);
		String userId = user.getUserId();
		model.addAttribute("email", email);
		model.addAttribute("userId", userId);
		return "/user/profileUpdate";
	}
}