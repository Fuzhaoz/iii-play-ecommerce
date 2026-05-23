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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiproject.lab02.controller.CipherUtils;
import com.iiiproject.product.dao.ProductDao;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.service.IProductBeanService;
import com.iiiproject.product.service.ProductBeanService;

@Controller
public class UpdateProduct {
	@Autowired
	IProductBeanService pbs;
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(path="/update", method = RequestMethod.GET)
	public String upload() {
		return "product/updateProduct";
		
		
	}
	
	@RequestMapping(path= "/updateProduct.do", method = RequestMethod.POST)
	protected String action1() {
		System.out.println("98765431");
		return "index";
	}
	
	@RequestMapping(path= "/product/updateProduct.do", method = RequestMethod.POST)
	protected String action(@RequestParam("picture1") MultipartFile multipartFile1,
							@RequestParam("picture2") MultipartFile multipartFile2,
							@RequestParam("picture3") MultipartFile multipartFile3,
							@RequestParam("id") int id,
		
		HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
		
		request.setCharacterEncoding("UTF-8"); 
		
		
		System.out.println("123456789");
		
		//讀取輸入資料
		

		byte[] pdimg1 = multipartFile1.getBytes();
		byte[] pdimg2 = multipartFile2.getBytes();
		byte[] pdimg3 = multipartFile3.getBytes();
	
		ProductBean pb = pbs.select(id);	
		pb.setPdimg1(pdimg1);
		pb.setPdimg2(pdimg2);
		pb.setPdimg3(pdimg3);
		pbs.updateProduct(pb);

		return "index";

}
}
