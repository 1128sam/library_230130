package com.library.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.common.FileManagerService;
import com.library.post.dao.PostDAO;
import com.library.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private FileManagerService fms;

	public List<Post> getPostNoticeList(Integer num) {
		return postDAO.selectPostNoticeList(num);
	}

	public List<Post> getPostRecommendList(Integer num) {
		return postDAO.selectPostRecommendList(num);
	}

	public Post getPostById(int id) {
		return postDAO.selectPostById(id);
	}

	public int addPost(String userName, String title, String content, Integer userId, int type, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			// only when file exists => image path
			imagePath = fms.saveFile(userName, file);
		}
		return postDAO.insertPost(title, content, userId, type, imagePath);
	}
	
	public void deletePost(int postId) {
		postDAO.deletePost(postId);
	}
	
	public int updatePost(int postId, String title, String content) {
		return postDAO.updatePost(postId, title, content);
	}
}