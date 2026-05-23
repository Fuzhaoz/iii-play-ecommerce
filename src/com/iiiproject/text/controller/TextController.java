package com.iiiproject.text.controller;





import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiproject.text.model.text1;
import com.iiiproject.text.service.ITextService;


 
@Controller
@RequestMapping("/text")
public class TextController {

	@Autowired
	ITextService tservice;
	



	@GetMapping(value =  "/showas" ,produces = {"application/json"})
	public ResponseEntity<text1> pddetail(@RequestParam("uid") String uId,
			@RequestParam("uphone") String uphone ,@RequestParam("usex") String usex ,HttpServletRequest request ,Model model) {
		
		  text1 tx =  tservice.finduser(uId, uphone, usex);
		  
	      if(tx != null) {
	    	  
	    	  ResponseEntity<text1> re  = new ResponseEntity<>(tx, HttpStatus.OK);
				return re;
	      }else {
	    	  text1 t =new text1();
	    	 
	    	 
	    	  ResponseEntity<text1> re  = new ResponseEntity<>(t, HttpStatus.OK);
				
	    	  return re;
	      }
		 
	}
	@GetMapping("/showview")
	public String allhots(Model model) {
	
		return "product/text";

	}
	
	
}
