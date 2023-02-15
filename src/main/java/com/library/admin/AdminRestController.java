package com.library.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.main.bo.BookBO;
import com.library.user.bo.UserBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@RestController
public class AdminRestController {
	@Autowired
	private BookBO bookBO;
	@Autowired
	private UserBO userBO;

	@PostMapping("/add_book")
	public Map<String, Object> addBook(HttpSession session, @RequestParam("title") String title,
			@RequestParam("author") String author, @RequestParam("issn") String isbn,
			@RequestParam("publisher") String publisher, @RequestParam("year") int year,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		Map<String, Object> result = new HashMap<>();
		String userName = userBO.getUserNameByUserId((int) session.getAttribute("userId"));
		int row = bookBO.addBook(userName, title, author, isbn, publisher, year, category, file);
		if (row == 1) {
			result.put("code", 1);
			result.put("result", "successfully added.");
		} else {
			result.put("code", 500);
			result.put("result", "failed to add.");
		}
		return result;
	}
}