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
import com.library.main.model.Book;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/book")
@RestController
public class BookRestController {
	@Autowired
	private BookBO bookBO;

	@GetMapping("/rent_book")
	public Map<String, Object> rentBook(HttpSession session, Model model, @RequestParam("bookId") int bookId) {
		Map<String, Object> result = new HashMap<>();
		int statusCnt = bookBO.getBorrowedBookCntByUserId((int) session.getAttribute("userId"));
		if (statusCnt > 2) {
			result.put("code", 402);
			result.put("result", "You have reached the maximum numbers of books you can borrow. Please retry after returning your books.");
			return result;
		}

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

	@GetMapping("/return_book")
	public Map<String, Object> returnBook(HttpSession session, Model model, @RequestParam("bookId") int bookId) {
		Map<String, Object> result = new HashMap<>();
		Book book = bookBO.getBookByBookId(bookId);
		if (book.getStatus() == 1 || book.getStatus() == 2) {
			int row = bookBO.returnBookByBookId(bookId);
			if (row == 1) {
				bookBO.updateBookStatusAsReturned(bookId);
				result.put("code", 1);
				result.put("result", "successfully returned.");
			} else {
				result.put("code", 401);
				result.put("result", "failed to return.");
			}
		}
		return result;
	}
}