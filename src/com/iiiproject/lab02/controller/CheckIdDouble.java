package com.iiiproject.lab02.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.iiiproject.lab02.service.IMemberService;

@Controller
public class CheckIdDouble {
	
	@Autowired
	private IMemberService mService;
	
	
	@RequestMapping("CheckMemberIdServlet")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("id");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		boolean result = false;
		Map<String, String> map = new HashMap<>();
		if (memberId != null && memberId.trim().length() != 0) {
			try {
			   
		       result = mService.isDup(memberId);
			   if(result==true) {
				   System.out.println("此帳號已存在");
				   
			   }else {
				   System.out.println("此帳號不存在");
			   }
			} catch(Exception ex){
				ex.printStackTrace();
			}
		}
		out.println(gson.toJson(result));
		out.close();
	}
}
