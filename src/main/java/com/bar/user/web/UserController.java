package com.bar.user.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bar.user.constants.User;
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

	// 회원가입 ++ 0325 중복처리
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String viewJoinPage() {
		return "user/join";
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView doJoinAction(@ModelAttribute("joinForm") 
	@Valid UserVO userVO, Errors errors) {
		// if (errors.hasErrors()) {
		// return new ModelAndView("redirect:member/join");
		// }
		if (userService.createUser(userVO)) {
			return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/join");
	}
	
	@RequestMapping("/api/duplicate/email")
	@ResponseBody
	public Map<String, Boolean> apiIsDuplicateEmail(
			@RequestParam String email){
		
		boolean isDuplicateEmail = userService.readDuplicateEmail(email);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("respEmail", isDuplicateEmail);
		
		return response;
	}
	
	
	
	// 회원가입 ++ 0325 중복처리
	
	// 0325 로그인 로그아웃 시작
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLoginPage(HttpSession session) {
		if (session.getAttribute(User.USER) != null) {
			return "redirect:/main";
		}
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLoginAction(@ModelAttribute("loginForm") 
	@Valid UserVO userVO, Errors errors,
			HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO loginUser = userService.readUser(userVO);
		if (loginUser != null) {
			session.setAttribute(User.USER, loginUser);
			return "redirect:/main";
		}
		return "redirect:/login";
	}

	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	// 0325 로그인 로그아웃 끝

}
