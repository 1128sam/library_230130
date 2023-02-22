package com.library.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.main.bo.BookBO;
import com.library.main.model.Book;
import com.library.main.model.BookStatus;
import com.library.user.bo.UserBO;
import com.library.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private UserBO userBO;
	@Autowired
	private BookBO bookBO;

	@GetMapping("/admin_view")
	public String adminView(HttpSession session, Model model) {
		model.addAttribute("viewName", "admin/admin");
		return "template/layout";
	}

	@GetMapping("/add_book_view")
	public String addBookView(Model model) {
		model.addAttribute("viewName", "book/addBook");
		return "template/layout";
	}

	@GetMapping("/overdue_user_view")
	public String overDueUserListView(Model model, @RequestParam(value="isPassedCheck", required=false) String isPassedCheck) {
		List<BookStatus> overdueBookStatusList = new ArrayList<>();
		// (userId) (bookId)
		if (isPassedCheck == "" || isPassedCheck == null) { // 안거르고
			overdueBookStatusList = bookBO.getOverdueBookStatusByBookId(""); // from `book_status`
		} else { // 반납기한 지난것들만
			overdueBookStatusList = bookBO.getOverdueBookStatusByBookId(isPassedCheck);
		}

		model.addAttribute("nowDate", new Date());
		model.addAttribute("overdueBookStatusList", overdueBookStatusList);
		List<User> overdueUserList = new ArrayList<>();
		List<Book> overdueBookList = new ArrayList<>();
		for (int i = 0; i < overdueBookStatusList.size(); i++) {
			overdueUserList.add(userBO.getUserInfoById(overdueBookStatusList.get(i).getUserId()));
			overdueBookList.add(bookBO.getBookByBookId(Integer.valueOf(overdueBookStatusList.get(i).getBookId())));
		}
		model.addAttribute("overdueUserList", overdueUserList);
		model.addAttribute("overdueBookList", overdueBookList);
		model.addAttribute("viewName", "admin/overdueList");
		return "template/layout";
	}
}