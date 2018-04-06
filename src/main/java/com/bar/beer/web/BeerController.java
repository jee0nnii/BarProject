package com.bar.beer.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bar.beer.service.BeerService;
import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

import web.pager.explorer.PageExplorer;

@Controller
public class BeerController {

	private BeerService beerService;
	public void setBeerService(BeerService beerService) {
		this.beerService = beerService;
	}
	/*@RequestMapping("/wehave")
	public ModelAndView viewWeHavePage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/wehave");
		
		List<BeerVO> beerList = beerService.getAll();
		view.addObject("beerList",beerList);
		return view;
	}*/
	@RequestMapping("/wehave")
	public ModelAndView viewWeHavePage(BeerPageVO beerPageVO, HttpSession session) {
		
		if(beerPageVO.getPageNo()<0) {
			beerPageVO = (BeerPageVO)session.getAttribute("__PAGE__");
			if(beerPageVO == null) {
				beerPageVO = new BeerPageVO();
				beerPageVO.setPageNo(0);
			}
		}
		
		session.setAttribute("__PAGE__", beerPageVO);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/wehave");
		
		PageExplorer pageExplorer = beerService.getAll(beerPageVO);
		view.addObject("pageExplorer",pageExplorer);
		return view;
	}
	
	@RequestMapping("/beer/desc/{beerId}")
	public ModelAndView viewBeerDescPage(@PathVariable int beerId) {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/beerDesc");
		
		BeerVO beerOne = beerService.getOne(beerId);
		view.addObject("desc", beerOne);
		return view;
	}
}
