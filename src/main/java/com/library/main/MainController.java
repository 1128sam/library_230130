package com.library.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String searchListView(Model model, 
			@RequestParam(value="bookList", required=false) List<Book> bookList,
			@RequestParam(value="category", required=false) Integer category
			) {
//		List<Book> bookList = bookBO.getBookList();
		if (category == null) {
			model.addAttribute("bookList", bookList);
		} else {
			List<Book> bookListByCat = bookBO.getBookListByCat(category);
			model.addAttribute("bookList", bookListByCat);
		}
		return "main/searchList0";
	}
}