package com.library.post;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.post.bo.PostBO;
import com.library.post.model.Post;
import com.library.user.bo.UserBO;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;

	@GetMapping("/post_list_view")
	public String postListView(Model model, @RequestParam("type") String type, HttpSession session, @RequestParam("page") int page) {
		if (session.getAttribute("userId") == null) {
			// takes the user to login page when the user is not signed in or the user's session has expired
			model.addAttribute("viewName", "user/signIn");
			return "template/layout";
		}
		Integer userType = userBO.getUserInfoById((Integer) session.getAttribute("userId")).getType();
		model.addAttribute("userType", userType);
		if (type.equals("info")) {
			model.addAttribute("viewName", "post/postNotice");
			int max = postBO.getPostCnt(0);
			if (page * 10 >= max) {
				model.addAttribute("postMax", max);
			}
		List<Post> noticeList = postBO.getPostNoticeList2(page, 0);

		model.addAttribute("page", page);
		model.addAttribute("list", noticeList);
		List<String> userNameList = new ArrayList<>();
		for (int i = 0; i < noticeList.size(); i++) {
			// get userNames and insert them into userNameList using postId
			userNameList.add(userBO.getUserNameByUserId(noticeList.get(i).getUserId()));
		}
		model.addAttribute("userNameList", userNameList);
	} else if (type.equals("rec")) {
		model.addAttribute("viewName", "post/postRecommend");
		int max = postBO.getPostCnt(1);
		if (page * 10 >= max) {
			model.addAttribute("postMax", max);
		}
		List<Post> recommendList = postBO.getPostNoticeList2(page, 1);

		model.addAttribute("page", page);
		model.addAttribute("list", recommendList);
		model.addAttribute("list", recommendList);
		List<String> userNameList = new ArrayList<String>();

		for (int i = 0; i < recommendList.size(); i++) {
			userNameList.add(userBO.getUserNameByUserId(recommendList.get(i).getUserId()));
		}
		model.addAttribute("userNameList", userNameList);
	}
		return "template/layout";
	}

	@GetMapping("/post_view")
	public String postView(Model model, @RequestParam("postId") int id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			model.addAttribute("viewName", "user/signIn");
			return "template/layout";
		}
		model.addAttribute("viewName", "/post/postView");
		Post post = postBO.getPostById(id);
		model.addAttribute("postUserName", userBO.getUserNameByUserId(post.getUserId()));
		if ((int) session.getAttribute("userType") == 0) {
			model.addAttribute("userType", 0);
		}
		model.addAttribute("post", post);
		model.addAttribute("sessUserId", session.getAttribute("userId"));
		return "template/layout";
	}

	@GetMapping("/new_post_view")
	public String newPostView(Model model, @RequestParam("type") int type, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			model.addAttribute("viewName", "user/signIn");
			return "template/layout";
		}
		model.addAttribute("type", type);
		model.addAttribute("viewName", "/post/newPost");
		return "template/layout";
	}

	@GetMapping("/update_post_view")
	public String updatePostView(Model model, @RequestParam("postId") int postId) {
		model.addAttribute("viewName", "/post/updatePost");
		model.addAttribute("post", postBO.getPostById(postId));
		return "template/layout";
	}
}