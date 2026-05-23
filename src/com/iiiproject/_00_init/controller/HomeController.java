package com.iiiproject._00_init.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiproject.product.service.IProductBeanService;


@Controller
public class HomeController {

	@Autowired
	IProductBeanService pdService;
	

	


	@RequestMapping("/")
	public String home(Model model) {
		
		model.addAttribute("memberList", pdService.selectAll());

		return "product/Shops2";
	
	}




}
