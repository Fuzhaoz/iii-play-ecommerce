package com.iiiproject.product.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.product.model.LikeBean;
import com.iiiproject.product.model.OrderItem;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.model.Productcollect;
import com.iiiproject.product.model.ReplyBean;
import com.iiiproject.product.service.IPdColservice;
import com.iiiproject.product.service.IProductBeanService;
import com.iiiproject.product.service.IReplyservice;
import com.iiiproject.product.service.ShoppingCart;

@Controller
@RequestMapping("/product")

public class PdController {

	@Autowired
	IProductBeanService pdService;

	@Autowired
	IReplyservice iRService;

	@Autowired
	IPdColservice pcService;

	@GetMapping("/allproducts")
	public String allproducts(Model model) {
		model.addAttribute("memberList", pdService.selectAll());
		return "product/Shops2";

	}

	@GetMapping("/allproducts1")
	public String allproducts1(Model model) {
		model.addAttribute("memberList", pdService.selectAll());
		return "product/fragment_allproducts";

	}

	@GetMapping("/allhots")
	public String allhots(Model model) {
		model.addAttribute("memberList", pdService.selectHot());
		model.addAttribute("tag", "hot");
		return "product/fragment_allproducts";

	}

	@GetMapping("/newpd")
	public String newpd(Model model) {

		model.addAttribute("memberList", pdService.newpd());
		model.addAttribute("tag", "new");
		return "product/fragment_allproducts";

	}

	@GetMapping("/category.do/{com}")
	public String category(@PathVariable("com") String com, Model model) {

		List<ProductBean> beans = pdService.category(com);
		model.addAttribute("memberList", beans);
		return "product/fragment_allproducts";

	}

	@GetMapping("/type.do/{type}")
	public String type(@PathVariable("type") String type, Model model) {

		List<ProductBean> beans = pdService.type(type);
		model.addAttribute("memberList", beans);
		return "product/fragment_allproducts";
	}
	@GetMapping("/price")
	public String price(@RequestParam("price1") int price1,
			@RequestParam("price2") int price2, Model model) {
		List<ProductBean> qprice = pdService.queryprice(price1, price2);
		model.addAttribute("memberList", qprice);
		return "product/fragment_allproducts";
	}

	@GetMapping("/Cart.do")
	public String order(HttpServletRequest request, Model model) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

		if (cart == null) {
			cart = new ShoppingCart();
			request.getSession().setAttribute("cart", cart);
		}

		return "product/Shoporder";

	}

	@GetMapping("/ProductDetail.do/Cart.do")
	public String pddetail(@RequestParam("pid") int pdId, @RequestParam("quantity") int num, HttpServletRequest request,
			Model model) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

		if (cart == null) {
			cart = new ShoppingCart();
			request.getSession().setAttribute("cart", cart);
		}

		ProductBean pBean = pdService.select(pdId);

		OrderItem orderItem = new OrderItem();
		orderItem.setProduct(pBean);
		orderItem.setNum(num);
		cart.addOrderItem(orderItem);

		return "product/Shoporder";
	}

	@GetMapping(value = "/ProductDetail.do/CartJs.do", produces = { "application/json" })
	public ResponseEntity<ShoppingCart> ADDCART(@RequestParam("pid") int pdId, @RequestParam("quantity") int num,
			HttpServletRequest request, Model model) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new ShoppingCart();
			request.getSession().setAttribute("cart", cart);
		}

		ProductBean pBean = pdService.select(pdId);
		OrderItem orderItem = new OrderItem();
		orderItem.setProduct(pBean);
		orderItem.setNum(num);
		cart.addOrderItem(orderItem);
		ResponseEntity<ShoppingCart> re = new ResponseEntity<>(cart, HttpStatus.OK);
		return re;
	}

	@GetMapping(value = "/CartCount", produces = { "application/json" })
	public ResponseEntity<Integer> CartCount(HttpServletRequest request) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		int count = 0;
		if (cart != null) {
			count = cart.getOrderItems().size();
		}
		ResponseEntity<Integer> re = new ResponseEntity<>(count, HttpStatus.OK);
		return re;
	}

	@GetMapping(value = "/ProductDetail.do/update.do", produces = { "application/json" })
	public ResponseEntity<ShoppingCart> update(@RequestParam("pid") int pdId, @RequestParam("quantity") int num,
			HttpServletRequest request, Model model) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

		ProductBean pBean = pdService.select(pdId);
		OrderItem orderItem = new OrderItem();
		orderItem.setProduct(pBean);
		orderItem.setNum(num);
		cart.update(orderItem);

		ResponseEntity<ShoppingCart> re = new ResponseEntity<>(cart, HttpStatus.OK);
		return re;

	}

	@GetMapping("/CartServlet1.do")
	public String clearcart(HttpServletRequest request, Model model) {

		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		cart.clearOrderItem();

		return "product/Shoporder";
	}

	@GetMapping("/remove.do/{pid}")
	public String removecart(@PathVariable("pid") int pdId, HttpServletRequest request, Model model) {
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		cart.removeOrderItem(pdId);
		return "product/Shoporder";
	}

	@GetMapping("/ProductDetail.do/{pid}")
	public String detail(@PathVariable("pid") Integer pdId, Model model) {

		ProductBean pBean = pdService.select(pdId);
		model.addAttribute("detail", pBean);
		List<ReplyBean> list = iRService.getReplyPd(pdId);
		model.addAttribute("rplist", list);
		return "product/Shopdetail";
	}

	@GetMapping("/Querytype.do")
	public String Querytype(@RequestParam("type") String type, Model model) {
		String lowerType = type.toLowerCase();
		List<ProductBean> beans;
		List<String> knownCategories = Arrays.asList("mouse", "keyboard", "headset", "mousepad");
		if (knownCategories.contains(lowerType)) {
			beans = pdService.selecttype(lowerType);
		} else {
			beans = pdService.searchpdname(type);
		}
		model.addAttribute("memberList", beans);
		return "product/Shops2";
	}

	@GetMapping("/autocomplete.do")
	public String autoComplete(@RequestParam("keyword") String keyword, Model model) {
		List<ProductBean> beans = pdService.searchByKeyword(keyword);
		model.addAttribute("memberList", beans);
		return "product/fragment_allproducts";
	}

	@GetMapping("/ProductDetail.do/Images.do/{pid}")
	public void Images(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image = pdService.loadimage(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image);
		outputStream.close();
		return;

	}

	@GetMapping("/remove.do/Images.do/{pid}")
	public void Images10(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image = pdService.loadimage(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image);
		outputStream.close();
		return;

	}

	@GetMapping("/Images.do/{pid}")
	public void Images0(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image = pdService.loadimage(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image);
		outputStream.close();
		return;

	}

	@GetMapping("/Images.do1/{pid}")
	public void Images1(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image1 = pdService.loadimage1(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image1);
		outputStream.close();
		return;

	}

	@GetMapping("/Images.do2/{pid}")
	public void Images2(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image2 = pdService.loadimage2(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image2);
		outputStream.close();
		return;

	}

	@GetMapping("/Images.do3/{pid}")
	public void Images3(@PathVariable("pid") int pdId, ServletResponse response, Model model) throws IOException {
		response.setContentType("image/jpeg");
		byte[] image3 = pdService.loadimage3(pdId);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(image3);
		outputStream.close();
		return;

	}

	@GetMapping(value = "/showallcount")
	public ResponseEntity<Long> showallcount() {

		Long acount = null;

		acount = pdService.allpdcount();

		ResponseEntity<Long> re = new ResponseEntity<>(acount, HttpStatus.OK);
		return re;
	}

	@GetMapping(value = "/showtypecount")
	public ResponseEntity<Long> showtypecount(@RequestParam("type") String type) {

		Long acount = null;

		acount = pdService.typepdcount(type);

		ResponseEntity<Long> re = new ResponseEntity<>(acount, HttpStatus.OK);
		return re;

	}

	@GetMapping(value = "/showcatecount")
	public ResponseEntity<Long> showcatecount(@RequestParam("cate") String cate) {

		Long acount = null;

		acount = pdService.catepdcount(cate);

		ResponseEntity<Long> re = new ResponseEntity<>(acount, HttpStatus.OK);
		return re;

	}

	

	@GetMapping("/addcol")
	public ResponseEntity<Productcollect> addcol(HttpServletRequest request, @RequestParam("pdId") int productId) {

		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		System.out.println(productId);
		ProductBean pBean = new ProductBean();
		pBean.setProductId(productId);

		Productcollect pdc = new Productcollect();
		pdc.setMemberBean(user);
		pdc.setPdBean(pBean);
		pdc.setColdate(new Timestamp(System.currentTimeMillis()));
		Productcollect addcol = pcService.addcol(pdc);
		ResponseEntity<Productcollect> re = new ResponseEntity<Productcollect>(addcol, HttpStatus.OK);
		return re;
	}

	@GetMapping("/checkcol")
	public ResponseEntity<Boolean> isFavo(HttpServletRequest request, @RequestParam("pdId") Integer productId) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		Integer userId = user.getPk();

		Boolean col = pcService.ifcol(productId, userId);

		ResponseEntity<Boolean> re = new ResponseEntity<Boolean>(col, HttpStatus.OK);
		return re;
	}

	@GetMapping("/deletcol")
	public ResponseEntity<Boolean> deleFavo(HttpServletRequest request, @RequestParam("pid") Integer productId) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		Integer userId = user.getPk();
		Boolean result = pcService.delecol(productId, userId);

		ResponseEntity<Boolean> re = new ResponseEntity<Boolean>(result, HttpStatus.OK);
		return re;
	}

	@GetMapping("/colpd")
	public String colpd(HttpServletRequest request, Model model) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		Integer userId = user.getPk();
		String uId = user.getId();
		List<Productcollect> colpd = pcService.getcol(userId);

		model.addAttribute("memberList", colpd);


		return "product/fragment_collect";
	}

}
