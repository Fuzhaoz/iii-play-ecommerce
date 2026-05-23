package com.iiiproject.product.controller;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiproject.lab02.controller.CipherUtils;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.service.IProductBeanService;
import com.iiiproject.product.service.ProductBeanService;

@Controller
public class InsertProduct {
	@Autowired
	IProductBeanService pbs;
	
	@RequestMapping("/product/insert")
	public String upload() {
		return "product/InsertProduct";
		
		
	}
	
	@RequestMapping(path= "/product/insertProduct.do", method = RequestMethod.POST)
	protected String action(@RequestParam("picture") MultipartFile multipartFile,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
		
		request.setCharacterEncoding("UTF-8"); 
		
		
		//
		String pdno =request.getParameter("pdno");
		String name = request.getParameter("pdname");
		
		String category = request.getParameter("category");
		String companyId = request.getParameter("companyId");
		String stringPrice = request.getParameter("price");
		Integer price= Integer.valueOf(stringPrice);
		String stringStock = request.getParameter("stock");
		Integer stock= Integer.valueOf(stringStock);
		
		
		
		Timestamp time= new Timestamp(System.currentTimeMillis());//
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		String timeStr = df.format(time); 
		Timestamp timeSql = Timestamp.valueOf(timeStr); 
		Timestamp registerTime = timeSql;
		byte[] pdimg = multipartFile.getBytes();
		
		ProductBean pb= new ProductBean(pdno,name,category,pdimg,price,stock,companyId,registerTime);
		 
		pbs.insert(pb);
		
		
		return "index";
		
	
	
}
}
