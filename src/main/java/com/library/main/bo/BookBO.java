package com.library.main.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.main.Book;
import com.library.main.dao.BookDAO;

@Service
public class BookBO {
	@Autowired
	private BookDAO bookDAO;

	public List<Book> getBookList() {
		return bookDAO.selectBookList();
	}
	
	public List<Book> getBookListBySearchSearchType(String search, String searchType) {
		return bookDAO.selectBookListBySearchSearchType(search, searchType);
	}

	public List<Book> getBookListByCat(int category) {
		return bookDAO.selectBookListByCat(category);
	}
}