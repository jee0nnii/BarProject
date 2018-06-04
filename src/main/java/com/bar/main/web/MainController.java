package com.bar.main.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bar.admin.vo.FestaVO;
import com.bar.main.service.MainService;

@Controller
public class MainController {
	
	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping(value = "/main00", method = RequestMethod.GET)
	public String viewMain00Page() {
		return "bar/main00";
	}
	
	//RealMain
	@RequestMapping("/main")
	public ModelAndView viewMainPage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/main");
		System.out.println("main controller!!");
		List<FestaVO> festaList = mainService.getAllFestas();
		System.out.println("festList : " + festaList.get(0).getFestaName());
		
		view.addObject("festa",festaList);
		return view;
	}
	
	
	
}
