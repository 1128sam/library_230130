package com.library.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.main.Book;

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

	public String selectBorrowedUserIdByBookId(int bookId);
}