package com.bar.beer.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bar.beer.service.BeerEvalService;
import com.bar.beer.service.BeerService;
import com.bar.beer.vo.BeerEvalVO;
import com.bar.user.constants.User;
import com.bar.user.service.UserService;
import com.bar.user.vo.UserVO;

@Controller
public class BeerEvalController {

	private BeerEvalService beerEvalService;
	private UserService userService;
	private BeerService beerService;

	public void setBeerEvalService(BeerEvalService beerEvalService) {
		this.beerEvalService = beerEvalService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setBeerService(BeerService beerService) {
		this.beerService = beerService;
	}

	@RequestMapping(value = "/api/evalRead/{beerId}", method = RequestMethod.GET)
	@ResponseBody
	public List<BeerEvalVO> getAllEval(@PathVariable int beerId){
		return beerEvalService.readAllEvals(beerId);
	}
	
	@RequestMapping("/api/evalWrite/{beerId}")
	@ResponseBody
	public Map<String, Object> createEval(@PathVariable int beerId, 
			HttpSession session, BeerEvalVO beerEvalVO) {
		System.out.println("이거 실행되나연~~~~~~~~~~~~");
		
		UserVO user = (UserVO) session.getAttribute(User.USER);
		beerEvalVO.setId(user.getId());
		beerEvalVO.setBeerId(beerId);
		
		boolean isSuccess = beerEvalService.createEval(beerEvalVO);
		
		BeerEvalVO newEval = null;
		if(isSuccess) {
			newEval = beerEvalService.readOneEval(beerEvalVO.getBeerEvalId());
			if(newEval != null) {
				System.out.println(newEval.getBeerEvalId());
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("status", isSuccess);		
		result.put("eval", newEval);
		
		return result;
	}

}
