package com.library.user.model;

import java.util.Date;

public class User {
	private int id;
	private String userId;
	private String password;
	private int type;
	private String name;
	private String email;
	private String imageUrl;
	private String self_vertify_que;
	private String self_vertify_ans;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getSelf_vertify_que() {
		return self_vertify_que;
	}

	public void setSelf_vertify_que(String self_vertify_que) {
		this.self_vertify_que = self_vertify_que;
	}

	public String getSelf_vertify_ans() {
		return self_vertify_ans;
	}

	public void setSelf_vertify_ans(String self_vertify_ans) {
		this.self_vertify_ans = self_vertify_ans;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}