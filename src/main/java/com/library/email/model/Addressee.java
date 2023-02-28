package com.library.email.model;

import com.library.main.model.Book;

public class Addressee {
	private String address;
	private String title;
	private String content;
	private Book book1;
	private Book book2;
	private Book book3;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Book getBook1() {
		return book1;
	}

	public void setBook1(Book book1) {
		this.book1 = book1;
	}

	public Book getBook2() {
		return book2;
	}

	public void setBook2(Book book2) {
		this.book2 = book2;
	}

	public Book getBook3() {
		return book3;
	}

	public void setBook3(Book book3) {
		this.book3 = book3;
	}
}