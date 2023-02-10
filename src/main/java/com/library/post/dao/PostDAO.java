package com.library.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.post.model.Post;

@Repository
public interface PostDAO {
	public List<Post> selectPostNoticeList(Integer num);
	public List<Post> selectPostRecommendList(Integer num);
	public Post selectPostById(int id);
}