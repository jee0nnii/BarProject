package com.bar.beer.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bar.beer.service.BeerService;
import com.bar.beer.vo.BeerVO;

@Controller
public class BeerController {

	private BeerService beerService;
	public void setBeerService(BeerService beerService) {
		this.beerService = beerService;
	}
	@RequestMapping(value = "/wehave", method = RequestMethod.GET)
	public ModelAndView viewWeHavePage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/wehave");
		
		List<BeerVO> beerList = beerService.getAll();
		view.addObject("beerList",beerList);
		return view;
	}
}
