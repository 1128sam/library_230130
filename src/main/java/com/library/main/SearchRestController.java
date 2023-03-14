package com.library.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.main.bo.BookBO;
import com.library.main.model.Book;

@RequestMapping("/search")
@RestController
public class SearchRestController {
	@Autowired
	private BookBO bookBO;

	@GetMapping("/search_engine")
	public Map<String, Object> searchEngine(HttpServletRequest request, @RequestParam("search") String search, @RequestParam("searchType") String searchType, Model model) {
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();

		List<Book> bookList = bookBO.getBookListBySearchSearchType(search, searchType);
		session.setAttribute("bookList", bookList);
		model.addAttribute("bookList", bookList);
		result.put("code", 1);
		return result;
	}
}