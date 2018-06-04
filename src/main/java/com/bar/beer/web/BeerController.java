package com.bar.beer.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bar.beer.service.BeerEvalService;
import com.bar.beer.service.BeerService;
import com.bar.beer.vo.BeerPageVO;
import com.bar.beer.vo.BeerVO;

import web.pager.explorer.PageExplorer;

@Controller
public class BeerController {

	private BeerService beerService;
	private BeerEvalService beerEvalService;
	
	public void setBeerService(BeerService beerService) {
		this.beerService = beerService;
	}
	public void setBeerEvalService(BeerEvalService beerEvalService) {
		this.beerEvalService = beerEvalService;
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
	
	@RequestMapping("/wehave/taste/{beerTasteId}")
	public ModelAndView viewTastePage(@PathVariable int beerTasteId,BeerVO beerVO, HttpSession session) {	
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/wehave");
		List<BeerVO> beerTaste = beerService.getTaste(beerVO.getBeerTasteId());
		System.out.println(beerTaste.get(0).getBeerImg());
		view.addObject("beerTaste",beerTaste);
		return view;
	}
	
	@RequestMapping("/wehave/type/{beerTypeId}")
	public ModelAndView viewTypePage(@PathVariable int beerTypeId, BeerVO beerVO, HttpSession session) {
			
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/wehave");
		List<BeerVO> beerType = beerService.getType(beerVO.getBeerTypeId());
		view.addObject("beerType",beerType);
		return view;
	}
	
	@RequestMapping("/beer/desc/{beerId}")
	public ModelAndView viewBeerDescPage(@PathVariable int beerId, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/beer/beerDesc");
		//List<BeerEvalVO> beerEval = beerEvalService.readAllEvals(beerId);
		
		BeerVO beerOne = beerService.getOne(beerId);
		view.addObject("desc", beerOne);
		//System.out.println(beerOne.getBeerTasteVO().getBeerTasteName());
		//view.addObject("beerEval", beerEval);
		return view;
	}
	
	@RequestMapping("/chooseLike/{beerId}")
	public String doChooseLike(@PathVariable int beerId) {
		boolean isSuccess = beerService.chooseLikeBeer(beerId);
		if(isSuccess) {
			return "redirect:/beer/desc/" + beerId;
		}
		return null;
	}
}
