package com.bar.user.web;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bar.user.service.UserService;
import com.bar.user.vo.UserVO;

@Controller
public class UserController {
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String viewMainPage() {
		return "bar/main";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String viewLoginPage() {
		return "user/login";
	}
	
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String viewJoinPage() {
		return "user/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView doJoinAction(@ModelAttribute("joinForm") 
									@Valid UserVO userVO, Errors errors) {
		if (errors.hasErrors()) {
			return new ModelAndView("redirect:member/join");
		}	
		if ( userService.createUser(userVO)) {
			return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/join");
	}
	
	
	
}
