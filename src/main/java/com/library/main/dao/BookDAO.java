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
}