package com.library.main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.main.bo.BookBO;
import com.library.main.model.Book;
import com.library.main.model.BookRegister;
import com.library.main.model.BookStatus;
import com.library.post.bo.PostBO;
import com.library.post.model.Post;
import com.library.user.bo.UserBO;
import com.library.user.model.User;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	private BookBO bookBO;
	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;

	@GetMapping("/template")
	public String main(Model model, HttpSession session) {
		model.addAttribute("viewName", "main/main");
		List<Post> noticeList = postBO.getPostNoticeList(5);
		model.addAttribute("noticeList", noticeList);
		List<Post> recommendList = postBO.getPostRecommendList(5);
		model.addAttribute("recList", recommendList);
		List<BookStatus> bsl = (List<BookStatus>) session.getAttribute("overdueBookStatusList");
		if (bsl != null) { // if the user has no books to return, we have nothing to alert, so I am going to show the list to the users who has books to return.
			if (bsl.size() > 0) {
				model.addAttribute("temp", 1);
//				popUpView(model, session);
			}
		}

		List<BookStatus> recent5 = bookBO.getBookStatusListOrderByReturnedAt5().stream().distinct().collect(Collectors.toList());;
		List<Book> book5 = new ArrayList<>();
		for (int i = 0; i < recent5.size(); i++) {
			book5.add(bookBO.getBookByBookId(Integer.valueOf(recent5.get(i).getBookId())));
		}
		model.addAttribute("recent5", book5);
		List<Book> popular5 = bookBO.getBookOrderByCount5(0);
		model.addAttribute("popular5", popular5);
		List<Book> rating5 = bookBO.getBookOrderByCount5(1);
		model.addAttribute("rating5", rating5);
		return "template/layout";
	}

	@GetMapping("/popup")
	public String popUpView(Model model, HttpSession session) {
		List<BookStatus> bsl = (List<BookStatus>) session.getAttribute("overdueBookStatusList");
		// overdueBookStatusList is set in session only once throughout the whole algorithm, and it is added as List<BookStatus>, which doesn't violate structural stability
		model.addAttribute("overdueBookStatusList", bsl);
		model.addAttribute("nowDate", new Date());
		List<User> overdueUserList = userBO.getUserById(session);
		List<Book> overdueBookList = bookBO.getBookByBookId2(session);
		model.addAttribute("overdueUserList", overdueUserList);
		model.addAttribute("overdueBookList", overdueBookList);
		session.removeAttribute("overdueBookStatusList"); // removing obsl from session to avoid any future errors until the user logs in again.
        return "/include/popup";
	}

	@GetMapping("/search_list_view")
	public String searchListView(Model model, 
			@RequestParam(value="bookList", required=false) List<Book> bookList,
			@RequestParam(value="category", required=false) Integer category
			) {
		if (category == null) {
			model.addAttribute("bookList", bookList);
		} else {
			List<Book> bookListByCat = bookBO.getBookListByCat(category);
			model.addAttribute("bookList", bookListByCat);
		}
		model.addAttribute("viewName", "main/searchList0");
		return "template/layout";
	}

	@GetMapping("/category_list_view")
	public String categoryListView(Model model) {
		model.addAttribute("viewName", "main/distBySection");
		return "template/layout";
	}

	@GetMapping("/book_info_view")
	public String bookInfoView(HttpSession session, Model model, @RequestParam("bookId") int bookId) {
		if (session.getAttribute("userId") == null) {
			model.addAttribute("viewName", "/user/signIn");
			return "template/layout";
		}
		Book book = bookBO.getBookByBookId(bookId);
		if (book.getStatus() == 1) {
			BookStatus bs = bookBO.getBookStatusByBookId(bookId);
			if (bs.getUserId() == (int) session.getAttribute("userId") || (Integer) session.getAttribute("userType") == 0) {
				model.addAttribute("borrowedUser", userBO.getUserNameByUserId(bs.getUserId()));
			}
			model.addAttribute("dueDate", bs.getDueDate());
		} else if (book.getStatus() == 2) {
			List<BookRegister> br = bookBO.getRegisteredBookListByBookId(bookId);
			model.addAttribute("registerNum", br.size());
			for (int i = 0; i < br.size(); i++) {
				if (br.get(i).getUserId() == (int) session.getAttribute("userId")) {
					model.addAttribute("registeredUser", br.get(i).getUserId());
				}
			}
			BookStatus bs = bookBO.getBookStatusByBookId(bookId);
			// either when the userId of the borrowed user and signed in user is same or when signed in user is admin, this adds borrowedUser attribute to model
			// to show admin who currently has the book.
			if (bs.getUserId() == (int) session.getAttribute("userId") || (Integer) session.getAttribute("userType") == 0) {
				model.addAttribute("borrowedUser", userBO.getUserNameByUserId(bs.getUserId()));
			}
			model.addAttribute("dueDate", bs.getDueDate());
		} else if (book.getStatus() == 0 && bookBO.getRegisteredBookCountByBookId(bookId) > 0) {
			if (bookBO.getRegisteredBookListByBookId(bookId).get(0).getUserId() == (int) session.getAttribute("userId")) {
				model.addAttribute("firstInLine", 1);
			}
			model.addAttribute("temp", bookBO.getRegisteredBookListByBookId(bookId));
		}
		model.addAttribute("book", book);
		model.addAttribute("viewName", "book/bookInfo");
		return "template/layout";
	}
}