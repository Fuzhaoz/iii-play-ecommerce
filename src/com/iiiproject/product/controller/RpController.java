package com.iiiproject.product.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.product.model.ReplyBean;
import com.iiiproject.product.service.IReplyservice;

@Controller
@RequestMapping("/product")
public class RpController {
	
	@Autowired
	IReplyservice iRService;
	
	
	
	@PostMapping("/reply")
	public String save(HttpServletRequest request,@RequestParam("replyDetail") String replyDetail,
			@RequestParam("name") String name,
			@RequestParam("pId") Integer pId) {
	
		MemberBean user=(MemberBean)request.getSession().getAttribute("MemberBean");
		ReplyBean rBean = new ReplyBean();
		rBean.setPdId(pId);
		rBean.setId(user.getId());
		rBean.setName(name);
		rBean.setDetail(replyDetail);
		rBean.setReplyDate(new Timestamp(System.currentTimeMillis()));
		iRService.insertReply(rBean);
		
	
		return "redirect:/product/ProductDetail.do/"+pId;
	}
	
	@GetMapping("/replylist/{pdId}")
	public String pdReply(@PathVariable("pdId") Integer pdId, Model model) {
		
		List<ReplyBean> list = iRService.getReplyPd(pdId);
		model.addAttribute("rplist", list);
		
		
		return "/product/Shopdetail";
	}
	@GetMapping("/replydel/{rid}")
	public String dReply(HttpServletRequest request,@PathVariable("rid") Integer rid, Model model) {
		
		
		Integer pdid=iRService.queryRp(rid).getPdId();
		
		
	
			iRService.deleteRp(rid);
		

		return "redirect:/product/ProductDetail.do/"+pdid;
	}
	
	
}
