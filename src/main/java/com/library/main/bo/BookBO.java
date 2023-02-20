package com.library.main.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.FileManagerService;
import com.library.main.dao.BookDAO;
import com.library.main.model.Book;
import com.library.main.model.BookStatus;

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
}