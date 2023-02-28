package com.library.main.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.FileManagerService;
import com.library.main.dao.BookDAO;
import com.library.main.model.Book;
import com.library.main.model.BookStatus;
import com.library.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class BookBO {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private FileManagerService fms;

	public List<Book> getBookList() {
		return bookDAO.selectBookList();
	}
	
	public List<Book> getBookListBySearchSearchType(String search, String searchType) {
		return bookDAO.selectBookListBySearchSearchType(search, searchType);
	}

	public List<Book> getBookListByCat(int category) {
		return bookDAO.selectBookListByCat(category);
	}

	public int addBook(String userName, String title, String author, String isbn, String publisher, int year, String category, MultipartFile file) {
		String filePath = null;
		if (file != null) {
			filePath = fms.saveFile(userName, file);
		}
		return bookDAO.insertBook(title, author, isbn, publisher, year, category, filePath);
	}

	public Book getBookByBookId(int bookId) {
		return bookDAO.selectBookByBookId(bookId);
	}

	public List<Book> getBookByBookId2(HttpSession session) {
		List<BookStatus> bsl = (List<BookStatus>) session.getAttribute("overdueBookStatusList");
		List<Book> overdueBookList = new ArrayList<>();
		for (int i = 0; i < bsl.size(); i++) {
			overdueBookList.add(getBookByBookId(Integer.valueOf(bsl.get(i).getBookId())));
		}
		return overdueBookList;
	}

	public List<Book> getBookByBookId3() {
		List<BookStatus> bsl = bookDAO.selectOverdueBookStatus();
		List<Book> overdueBookList = new ArrayList<>();
		for (int i = 0; i < bsl.size(); i++) {
			overdueBookList.add(getBookByBookId(Integer.valueOf(bsl.get(i).getBookId())));
		}
		return overdueBookList;
	}

	public int addRentInfo(int userId, int bookId) {
		return bookDAO.insertRentInfoByUserIdBookId(userId, bookId);
	}

	public void updateBookStatus(int bookId) {
		bookDAO.updateBookStatus(bookId);
	}

	// borrowing
	public BookStatus getBookStatusByBookId(int bookId) {
		return bookDAO.selectBookStatusByBookId(bookId);
	}

	// returning
	public int returnBookByBookId(int bookId) {
		return bookDAO.returnBookByBookId(bookId);
	}
	public void updateBookStatusAsReturned(int bookId) {
		bookDAO.updateBookStatusAsReturned(bookId);
	}

	public List<Integer> getBookIdListByUserId(Integer userId1, Integer userId2) {
		return bookDAO.selectBookIdListByUserId(userId1, userId2);
	}

//	getting the number of currently borrowed books of a certain user to stop the user from borrowing more than three books at once
	public int getBorrowedBookCntByUserId(int userId) {
		return bookDAO.selectBorrowedBookCntByUserId(userId);
	}

	public Date getDueDateByBookId(int userId, int bookId) {
		return bookDAO.selectDueDateByBookId(userId, bookId);
	}

	public List<BookStatus> getOverdueBookStatusByBookId(String isPassedCheck) {
		int tmp;
		Date date;
		if (isPassedCheck == "" || isPassedCheck == null || isPassedCheck.isBlank() || isPassedCheck.isEmpty()) { // books that have passed the due date
			date = new Date();
			tmp = 1;
		} else { // books that have not passed the due date
			date = new Date(0); // default date
			tmp = 0;
		}
		System.out.println("tmp: " + tmp + ", date: " + date);
		return bookDAO.selectOverdueBookStatusByBookId(tmp, date);
	}
	// getting the userId list of the users who didn't return their books on time
//	public List<Integer> getOverDueUserIdByDate(Date date) {
//		return bookDAO.selectOverDueSmthIdByDate("userId", date);
//	}
//	public List<Integer> getOverDueBookIdByDate(Date date) {
//		return bookDAO.selectOverDueSmthIdByDate("bookId", date);
//	}

	public List<BookStatus> getOverdueBookStatusByUserId(int userId) {
		return bookDAO.selectOverdueBookStatusByUserId(userId);
	}

//	public List<BookStatus> getOverdueBookStatus() {
//		return bookDAO.selectOverdueBookStatus();
//	}
}