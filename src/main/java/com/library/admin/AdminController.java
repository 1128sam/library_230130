package com.library.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private UserBO userBO;
	@Autowired
	private BookBO bookBO;

	@GetMapping("/admin_view")
	public String adminView(HttpSession session, Model model) {
		if ((Integer) session.getAttribute("userType") != 0 || (Integer) session.getAttribute("userType") == null) {
			model.addAttribute("viewName", "main/main");
			return "template/layout";
		}
		model.addAttribute("viewName", "admin/admin");
		return "template/layout";
	}

	@GetMapping("/add_book_view")
	public String addBookView(Model model) {
		model.addAttribute("viewName", "book/addBook");
		return "template/layout";
	}

	@GetMapping("/update_book_view")
	public String updateBookView(Model model, @RequestParam("bookId") int bookId) {
		model.addAttribute("viewName", "book/updateBook");
		model.addAttribute("book", bookBO.getBookByBookId(bookId));
		model.addAttribute("bookId", bookId);
		return "template/layout";
	}

	@GetMapping("/overdue_user_view")
	public String overDueUserListView(Model model, @RequestParam(value="isPassedCheck", required=false) String isPassedCheck) {
		List<BookStatus> overdueBookStatusList = new ArrayList<>();
		if (isPassedCheck == "" || isPassedCheck == null) { // 안거르고
			overdueBookStatusList = bookBO.getOverdueBookStatusByBookId(""); // from `book_status`
		} else { // 반납기한 지난것들만
			overdueBookStatusList = bookBO.getOverdueBookStatusByBookId(isPassedCheck);
			model.addAttribute("checked", "checked");
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