package com.library.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.main.bo.BookBO;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	private BookBO bookBO;

	@GetMapping("/template")
	public String main() {
		return "template/layout";
	}

	@GetMapping("/search_list_view")
	public String searchListView(Model model) {
		List<Book> bookList = bookBO.getBookList();
		model.addAttribute("bookList", bookList);
		return "main/searchList0";
	}
}