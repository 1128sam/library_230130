package com.library.main.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.main.model.Book;
import com.library.main.model.BookRegister;
import com.library.main.model.BookStatus;

@Repository
public interface BookDAO {
	public List<Book> selectBookList();

	public List<Book> selectBookListBySearchSearchType(@Param("search") String search, @Param("searchType") String searchType);

	public List<Book> selectBookListByCat(int category);

	public int insertBook(
			@Param("title") String title,
			@Param("author") String author,
			@Param("isbn") String isbn,
			@Param("publisher") String publisher,
			@Param("year") int year,
			@Param("category") String category,
			@Param("filePath") String filePath
			);

	public int selectLatestAddedBookIdByISBN(String isbn);

	public Book selectBookByBookId(int id);
	
	public int insertRentInfoByUserIdBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public void updateBookStatusAs1(int bookId);
	public void updateBookStatusAs2(int bookId);

	public BookStatus selectBookStatusByBookId(int bookId);

	public int returnBookByBookId(@Param("bookId") int bookId, @Param("point") Float point);

	public void updateBookStatusAsReturned(int bookId);

	public List<Integer> selectBookIdListByUserId(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2);

	public int selectBorrowedBookCntByUserId(int userId);
	public int selectRegisteredBookCntByUserId(int userId);

	public Date selectDueDateByBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public List<BookStatus> selectOverdueBookStatusByBookId(@Param("tmp") int tmp, @Param("date") Date date);

	public List<BookStatus> selectOverdueBookStatusByUserId(int userId);

	public List<BookStatus> selectOverdueBookStatus();

	public int registerBookByUserIdBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public BookRegister selectNextRegisteredBookByBookId(int bookId);

	public void deleteRegisteration(@Param("userId") int userId, @Param("bookId") int bookId);

	public void updateBookRegisterByUserIdBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public List<BookRegister> selectRegisteredBookListByBookId(int bookId);
	public List<BookRegister> selectRegisteredBookListByUserId(int userId);

	public List<BookRegister> selectRegisteredBookListPassedDate();

	public int selectRegisteredBookCountByBookId(int bookId);

	public List<BookStatus> selectBookStatus1Week();

	public List<BookStatus> selectBookStatusListOrderByReturnedAt5();

	public List<Book> selectBookOrderByCount5(int type);

	public int updateBook(
			@Param("id") int id,
			@Param("title") String title,
			@Param("author") String author,
			@Param("isbn") String isbn,
			@Param("publisher") String publisher,
			@Param("year") int year,
			@Param("category") String category
			);
}