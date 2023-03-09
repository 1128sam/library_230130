package com.library.main.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.FileManagerService;
import com.library.main.dao.BookDAO;
import com.library.main.model.Book;
import com.library.main.model.BookRegister;
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

	public int getLatestAddedBookIdByISBN(String isbn) {
		return bookDAO.selectLatestAddedBookIdByISBN(isbn);
	}

	public int updateBook(int id, String title, String author, String isbn, String publisher, int year, String category) {
		return bookDAO.updateBook(id, title, author, isbn, publisher, year, category);
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

	public void updateBookStatusAs1(int bookId) {
		bookDAO.updateBookStatusAs1(bookId);
	}
	public void updateBookStatusAs2(int bookId) {
		bookDAO.updateBookStatusAs2(bookId);
	}

	// borrowing
	public BookStatus getBookStatusByBookId(int bookId) {
		return bookDAO.selectBookStatusByBookId(bookId);
	}

	// returning
	public int returnBookByBookId(int bookId, Float point) {
		return bookDAO.returnBookByBookId(bookId, point);
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
	public int getRegisteredBookCntByUserId(int userId) {
		return bookDAO.selectRegisteredBookCntByUserId(userId);
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

	public List<BookStatus> getOverdueBookStatusByUserId(int userId) {
		return bookDAO.selectOverdueBookStatusByUserId(userId);
	}

	// registering for book - inserts into `book_status`
	public int registerBookByUserIdBookId(int userId, int bookId) {
		return bookDAO.registerBookByUserIdBookId(userId, bookId);
	}

	// getting number of people who registered for the book
	public BookRegister getNextRegisteredBookByBookId(int bookId) {
		return bookDAO.selectNextRegisteredBookByBookId(bookId);
	}

	public void cancelRegisteration(int userId, int bookId) {
		bookDAO.deleteRegisteration(userId, bookId);
	}

	public void updateBookRegisterByUserIdBookId(int userId, int bookId) {
		bookDAO.updateBookRegisterByUserIdBookId(userId, bookId);
	}

	public List<BookRegister> getRegisteredBookListByBookId(int bookId) {
		return bookDAO.selectRegisteredBookListByBookId(bookId);
	}
	public List<BookRegister> getRegisteredBookListByUserId(int userId) {
		return bookDAO.selectRegisteredBookListByUserId(userId);
	}
	public List<Book> getBookListByUserId(int userId) {
		List<Book> temp = new ArrayList<>();
		List<BookRegister> brl = getRegisteredBookListByUserId(userId);
		for (int i = 0; i < brl.size(); i++) {
			temp.add(getBookByBookId(brl.get(i).getBookId()));
		}
		return temp;
	}
	public List<BookRegister> getRegisteredBookListPassedDate() {
		return bookDAO.selectRegisteredBookListPassedDate();
	}

	public int getRegisteredBookCountByBookId(int bookId) {
		return bookDAO.selectRegisteredBookCountByBookId(bookId);
	}

	public List<BookStatus> getBookStatus1Week() {
		return bookDAO.selectBookStatus1Week();
	}

	public List<BookStatus> getBookStatusListOrderByReturnedAt5() {
		return bookDAO.selectBookStatusListOrderByReturnedAt5();
	}

	public List<Book> getBookOrderByCount5(int type) {
		return bookDAO.selectBookOrderByCount5(type);
	}
}