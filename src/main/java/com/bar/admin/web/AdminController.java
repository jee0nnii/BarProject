package com.bar.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bar.admin.service.AdminService;
import com.bar.admin.vo.FestaVO;
import com.bar.beer.vo.BeerVO;

@Controller
public class AdminController {

	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String viewAdminPage() {
		return "bar/admin/manage";	
	}
	
	@RequestMapping(value = "/admin/beer/add", method = RequestMethod.GET)
	public String viewAddBeer() {
		return "bar/admin/add";
	}
	
	@RequestMapping(value = "/admin/beer/add", method = RequestMethod.POST)
	public ModelAndView doAddBeer(@ModelAttribute("addBeerForm") @Valid BeerVO beerVO, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/admin/add");
		view.addObject("beerVO", beerVO);
		
		boolean isSuccess = adminService.createBeerDesc(beerVO);
		if(isSuccess) {
			return new ModelAndView("redirect:/admin");
		}
		
		return new ModelAndView("redirect:/admin/beer/add");
	}
	
	@RequestMapping(value = "/admin/festa/add", method = RequestMethod.GET)
	public String viewAddFesta() {
		return "bar/admin/add";
	}
	
	@RequestMapping(value = "/admin/festa/add", method = RequestMethod.POST)
	public ModelAndView doAddFesta(@ModelAttribute("addFestaForm") @Valid FestaVO festaVO, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/admin/add");
		view.addObject("festaVO", festaVO);
		
		boolean isSuccess = adminService.createFesta(festaVO);
		if(isSuccess) {
			return new ModelAndView("redirect:/admin");
		}
		
		return new ModelAndView("redirect:/admin/festa/add");
	}
	
}
