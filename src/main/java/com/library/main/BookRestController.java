package com.library.main;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.main.bo.BookBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/book")
@RestController
public class BookRestController {
	@Autowired
	private BookBO bookBO;

	@GetMapping("/rent_book")
	public Map<String, Object> rentBook(HttpSession session, Model model, @RequestParam("bookId") int bookId) {
		Map<String, Object> result = new HashMap<>();
		Book book = bookBO.getBookByBookId(bookId);
		if (book.getStatus() == 0) {
			int row = bookBO.addRentInfo((int) session.getAttribute("userId"), bookId);
			if (row == 1) {
				result.put("code", 1);
				result.put("result", "successfully borrowed. Please come and pick up your book.");
				bookBO.updateBookStatus(bookId);
			} else {
				result.put("code", 401);
				result.put("result", "failed.");
			}
		} else if (book.getStatus() == 1) {
			result.put("code", 500);
			result.put("result", "이미 대여중입니다.");
		} else if (book.getStatus() == 2) {
			// gonna create a table for keeping track of registers
			result.put("code", 501);
			result.put("result", "이미 예약중입니다.");
		} else {
			result.put("code", 400);
		}

		return result;
	}
}