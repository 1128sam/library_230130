package com.library.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.email.mail.MailService;
import com.library.email.model.ReservedMail;
import com.library.main.bo.BookBO;
import com.library.main.model.BookRegister;
import com.library.user.bo.UserBO;

@RequestMapping("/admin")
@RestController
public class AdminRestController {
	@Autowired
	private BookBO bookBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private MailService ms;

	@PostMapping("/add_book")
	public Map<String, Object> addBook(HttpSession session, @RequestParam("title") String title,
			@RequestParam("author") String author, @RequestParam("isbn") String isbn,
			@RequestParam("publisher") String publisher, @RequestParam("year") int year,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		Map<String, Object> result = new HashMap<>();
		String userName = userBO.getUserNameByUserId((int) session.getAttribute("userId"));
		int row = bookBO.addBook(userName, title, author, isbn, publisher, year, category, file);
		if (row == 1) {
			result.put("code", 1);
			result.put("newId", bookBO.getLatestAddedBookIdByISBN(isbn));
			result.put("result", "successfully added.");
		} else {
			result.put("code", 500);
			result.put("result", "failed to add.");
		}
		return result;
	}

	@PostMapping("/update_book")
	public Map<String, Object> addBook(HttpSession session, @RequestParam("id") int id, @RequestParam("title") String title,
			@RequestParam("author") String author, @RequestParam("isbn") String isbn,
			@RequestParam("publisher") String publisher, @RequestParam("year") int year,
			@RequestParam(value = "category", required = false) String category) {
		Map<String, Object> result = new HashMap<>();
		int row = bookBO.updateBook(id, title, author, isbn, publisher, year, category);
		if (row == 1) {
			result.put("code", 1);
			result.put("id", id);
			result.put("result", "successfully updated.");
		} else {
			result.put("code", 500);
			result.put("result", "failed to update.");
		}
		return result;
	}

	@Scheduled(cron = "0 30 6 * * *")
	//at 6:30am everyday, the admin is going to remove a user who hasn't borrowed the book in the registeration list and is going to send email to the next person in the list.
	public void removeFromResgisterList() {
		List<BookRegister> brl = bookBO.getRegisteredBookListPassedDate();
		for (int i = 0; i < brl.size(); i++) {
			int userId = brl.get(i).getUserId();
			int bookId = brl.get(i).getBookId();
			bookBO.cancelRegisteration(userId, bookId);
			if (bookBO.getNextRegisteredBookByBookId(bookId) != null) {
				ReservedMail lrm = new ReservedMail();
				lrm.setAddress(userBO.getUserInfoById(bookBO.getNextRegisteredBookByBookId(bookId).getUserId()).getEmail());
				lrm.setTitle("The book you reserved has been returned: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor());
				lrm.setContent("The book you reserved has been returned: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor()
						+ "\n\nYour registeration will be canceled in 3 days.");
				ms.sendMailToReserved(lrm);
				bookBO.updateBookRegisterByUserIdBookId(userId, bookId); // changes `informedAt` column to NOW()
			}
		}
	}
}