package com.library.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.post.bo.PostBO;
import com.library.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostBO postBO;

	@GetMapping("/post_list_view")
	public String postListView(Model model, @RequestParam("type") String type) {
		if (type.equals("info")) {
			model.addAttribute("viewName", "post/postNotice");
			List<Post> noticeList = postBO.getPostNoticeList(0);
			model.addAttribute("list", noticeList);
		} else if (type.equals("rec")) {
			model.addAttribute("viewName", "post/postRecommend");
			List<Post> recommendList = postBO.getPostRecommendList(0);
			model.addAttribute("list", recommendList);
		}
		return "template/layout";
	}
	
	@GetMapping("/post_view")
	public String postView(Model model, @RequestParam("postId") int id) {
		model.addAttribute("viewName", "/post/postView");
		Post post = postBO.getPostById(id);
		model.addAttribute("post", post);
		return "template/layout";
	}

	@GetMapping("/new_post_view")
	public String newPostView(Model model) {
		model.addAttribute("viewName", "/post/newPost");
		return "template/layout";
	}
}