package com.library.main.model;

import java.util.Date;

public class BookRegister {
	private int id;
	private int userId;
	private int bookId;
	private Date informedAt;
	private Date createdAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public Date getInformedAt() {
		return informedAt;
	}

	public void setInformedAt(Date informedAt) {
		this.informedAt = informedAt;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}