package com.library.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.post.dao.PostDAO;
import com.library.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;

	public List<Post> getPostNoticeList(Integer num) {
		return postDAO.selectPostNoticeList(num);
	}

	public List<Post> getPostRecommendList(Integer num) {
		return postDAO.selectPostRecommendList(num);
	}

	public Post getPostById(int id) {
		return postDAO.selectPostById(id);
	}
}