package com.bar.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bar.user.constants.User;
import com.bar.user.service.UserService;
import com.bar.user.vo.UserVO;
import com.bar.util.DateUtil;

@Controller
public class UserController {
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String viewTestPage() {
		return "bar/test";
	}
	@RequestMapping(value = "/wehave", method = RequestMethod.GET)
	public String viewWeHavePage() {
		return "bar/wehave";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String viewMainPage() {
		return "bar/main";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String viewMyPage() {
		return "user/mypage";
	}

	// 회원가입 ++ 0325 중복처리 ++ 0328 생년월일
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView viewJoinPage(UserVO userVO) {
		ModelAndView view = new ModelAndView();
		
		//if(userVO == null) {
			setInitiateDate(view,userVO);
		//}
		
		userVO.setEndDate(DateUtil.makeDate(userVO.getEndDateYear(),
				userVO.getEndDateMonth(),
				userVO.getEndDateDate()));
		view.addObject("birthday", userVO);
		
		int endDateMaximumDate = DateUtil.getActualMaximumDate(
				Integer.parseInt(userVO.getEndDateYear()),
				Integer.parseInt(userVO.getEndDateMonth()));
		
		view.addObject("endDateMaximumDate", endDateMaximumDate);
		
		view.setViewName("user/join");
		return view;
	}

	@RequestMapping("/api/date/max/{year}/{month}")
	public void getMaxDate(@PathVariable int year, @PathVariable int month, HttpServletResponse response) {
		int maxDate = DateUtil.getActualMaximumDate(year, month);
		//데이터를 json으로 보낼 때 response body!!
		PrintWriter out = null;
		try {
			out = response.getWriter();	
			out.write(maxDate + "");
			out.flush();//데이터 내보냄
		}catch(IOException e){
			throw new RuntimeException(e.getMessage(),e);
		}finally {
			if(out != null) {
				out.close();
			}
		}	
	}	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView doJoinAction(@ModelAttribute("joinForm") @Valid UserVO userVO, Errors errors) {
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
	public Map<String, Boolean> apiIsDuplicateEmail(@RequestParam String email) {

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
	public String doLoginAction(@ModelAttribute("loginForm") @Valid UserVO userVO, Errors errors,
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

	// 생년월일 날짜
	private void setInitiateDate(ModelAndView view, UserVO userVO) {
		// 검색 초기화
		String endDate = DateUtil.getNowDate();
		String[] splitedEndDate = endDate.split("-");
		userVO.setEndDateYear(splitedEndDate[0]);
		userVO.setEndDateMonth(splitedEndDate[1]);
		userVO.setEndDateDate(splitedEndDate[2]);
		userVO.setEndDate(endDate);

		String startDate = DateUtil.getComputedDate(Integer.parseInt(splitedEndDate[0]),
				Integer.parseInt(splitedEndDate[1]), Integer.parseInt(splitedEndDate[2]), DateUtil.DATE, -7);

		String[] splitedStartDate = startDate.split("-");
		userVO.setStartDateYear(splitedStartDate[0]);
		userVO.setStartDateMonth(splitedStartDate[1]);
		userVO.setStartDateDate(splitedStartDate[2]);
		userVO.setStartDate(startDate);

		view.addObject("search", userVO);

		int startDateMaximumDate = DateUtil.getActualMaximumDate(Integer.parseInt(splitedStartDate[0]),
				Integer.parseInt(splitedStartDate[1]));
		int endDateMaximumDate = DateUtil.getActualMaximumDate(Integer.parseInt(splitedEndDate[0]),
				Integer.parseInt(splitedEndDate[1]));

		view.addObject("startDateMaximumDate", startDateMaximumDate);
		view.addObject("endDateMaximumDate", endDateMaximumDate);
	}
}
