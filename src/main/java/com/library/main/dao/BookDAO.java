package com.library.main.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.main.model.Book;
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

	public Book selectBookByBookId(int id);
	
	public int insertRentInfoByUserIdBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public void updateBookStatus(int bookId);

	public BookStatus selectBookStatusByBookId(int bookId);

	public int returnBookByBookId(int bookId);

	public void updateBookStatusAsReturned(int bookId);

	public List<Integer> selectBookIdListByUserId(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2);

	public int selectBorrowedBookCntByUserId(int userId);

	public Date selectDueDateByBookId(@Param("userId") int userId, @Param("bookId") int bookId);

	public List<BookStatus> selectOverdueBookStatusByBookId(Date date);
	public List<Integer> selectOverDueSmthIdByDate(@Param("type") String type, Date date);
}