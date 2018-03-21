package com.bar.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String viewMainPage() {
		return "bar/main";
	}
	
	@RequestMapping("/login")
	public String viewLoginPage() {
		return "bar/login";
	}
}
