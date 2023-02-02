package com.library.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/template")
	public String main() {
		return "template/layout";
	}
}