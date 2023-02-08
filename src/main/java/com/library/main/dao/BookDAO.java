package com.library.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.main.Book;

@Repository
public interface BookDAO {
	public List<Book> selectBookList();
}