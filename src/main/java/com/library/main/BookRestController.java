package com.library.main;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.email.mail.MailService;
import com.library.email.model.ReservedMail;
import com.library.main.bo.BookBO;
import com.library.main.model.Book;
import com.library.user.bo.UserBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/book")
@RestController
public class BookRestController {
	@Autowired
	private BookBO bookBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private MailService ms;

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
				if (bookBO.getRegisteredBookListByBookId(bookId).get(0).getUserId() == (int) session.getAttribute("userId")) {
					bookBO.cancelRegisteration((int) session.getAttribute("userId"), bookId);
				}
				result.put("code", 1);
				result.put("result", "successfully borrowed. Please come and pick up your book.");
				bookBO.updateBookStatusAs1(bookId);
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
	public Map<String, Object> returnBook(HttpSession session, Model model, @RequestParam("bookId") int bookId, @RequestParam(value="point", required=false) Float point) {
		Map<String, Object> result = new HashMap<>();
		Book book = bookBO.getBookByBookId(bookId);
		if (book.getStatus() == 1 || book.getStatus() == 2) {
			int row = bookBO.returnBookByBookId(bookId, point);
			if (row == 1) {
				bookBO.updateBookStatusAsReturned(bookId);
				if (bookBO.getNextRegisteredBookByBookId(bookId) != null) {
					// sending a mail to a user who have reserved for the book
					int userId = bookBO.getNextRegisteredBookByBookId(bookId).getUserId();
					ReservedMail lrm = new ReservedMail();
					lrm.setAddress(userBO.getUserInfoById(userId).getEmail());
					lrm.setTitle("The book you reserved has been returned: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor());
					lrm.setContent("The book you reserved has been returned: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor()
							+ "\n\nYour registeration will be canceled in 3 days.");
					ms.sendMailToReserved(lrm);
					bookBO.updateBookRegisterByUserIdBookId(userId, bookId); // changes `informedAt` column to NOW()
				}
				result.put("code", 1);
				result.put("result", "successfully returned.");
			} else {
				result.put("code", 401);
				result.put("result", "failed to return.");
			}
		}
		return result;
	}

	@GetMapping("/register_book")
	public Map<String, Object> registerBook(HttpSession session, Model model, @RequestParam("userId") int userId, @RequestParam("bookId") int bookId) {
		Map<String, Object> result = new HashMap<>();
		int statusCnt = bookBO.getRegisteredBookCntByUserId((int) session.getAttribute("userId"));
		if (statusCnt > 2) {
			result.put("code", 403);
			result.put("result", "You have reached the maximum numbers of books you can reserve.");
			return result;
		}

		if (bookBO.getBookByBookId(bookId).getStatus() == 1) { // borrowed, no registeration
			int row = bookBO.registerBookByUserIdBookId(userId, bookId);
			if (row == 1) {
				bookBO.updateBookStatusAs2(bookId);
				result.put("code", 1);
				result.put("result", "successfully registered. We will contact you when the book is returned.");
			} else {
				result.put("code", 401);
				result.put("result", "failed to register.");
			}
		} else if (bookBO.getBookByBookId(bookId).getStatus() == 2) { // borrowed + someone reserved for the book
			int row = bookBO.registerBookByUserIdBookId(userId, bookId); // success/fail
			if (row == 1) {
				result.put("code", 2);
				int cnt = bookBO.getRegisteredBookCountByBookId(bookId) - 1;
				if (cnt == 1) {
					result.put("result", "successfully registered. ");
					result.put("registerNum", cnt + " person is registered before you.");
				} else {
					result.put("result", "successfully registered. ");
					result.put("registerNum", cnt + " people are in front of you.");
				}
			} else {
				result.put("code", 402);
				result.put("result", "failed to add register.");
			}
		}
		return result;
	}

	@DeleteMapping("/cancel_register_book")
	public Map<String, Object> CancelRegisterBook(HttpSession session, Model model, @RequestParam("userId") int userId, @RequestParam("bookId") int bookId) {
		Map<String, Object> result = new HashMap<>();
		bookBO.cancelRegisteration(userId, bookId);
		result.put("code", 1);
		result.put("result", "registeration successfully canceled.");
		return result;
	}
}