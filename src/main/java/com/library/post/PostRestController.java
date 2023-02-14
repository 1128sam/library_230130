package com.library.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.post.bo.PostBO;
import com.library.post.model.Post;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@RestController
public class PostRestController {
	@Autowired
	private PostBO postBO;

	@PostMapping("/add_post")
	public Map<String, Object> addPost(HttpSession session, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("type") int type, @RequestParam("file") MultipartFile file) {
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		int row = postBO.addPost(title, content, userId, type, file);
		if (row == 1) {
			result.put("code", 1);
			result.put("result", "success");
		} else {
			result.put("code", 500);
			result.put("result", "fail");
		}
		return result;
	}

	@DeleteMapping("/delete_post")
	public Map<String, Object> deletePost(@RequestParam("postId") int postId, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		postBO.deletePost(postId);
		result.put("code", 1);
		result.put("result", "deleted.");
		return result;
	}

	@PostMapping("/update_post")
	public Map<String, Object> updatePost(@RequestParam("postId") int postId, @RequestParam("title") String title, @RequestParam("content") String content) {
		Map<String, Object> result = new HashMap<>();

		Post post = postBO.getPostById(postId);
		int row = postBO.updatePost(postId, title, content);
		if (row == 1) {
			result.put("code", 1);
			result.put("result", "successfully updated.");
			result.put("type", post.getType());
		} else {
			result.put("code", 500);
			result.put("result", "failed to update.");
		}
		return result;
	}
}