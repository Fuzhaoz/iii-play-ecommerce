package com.iiiproject.product.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiproject.lab02.controller.EmailUtility;
import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.product.model.OrderBean;
import com.iiiproject.product.model.OrderItem;
import com.iiiproject.product.model.OrderItemBean;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.service.IOrderservice;
import com.iiiproject.product.service.IProductBeanService;
import com.iiiproject.product.service.ShoppingCart;

@Controller
@RequestMapping("/product")

public class orderController {

	@Autowired
	IOrderservice odService;

	private String host = "smtp.gmail.com";
	private String port = "587";
	private String email1 = "futommy0228366023abc@gmail.com";

	private String name1 = "iiiPlay Administer";

	private String pass = "srlquzlkzreobcjp";

	@GetMapping("/saveorder")
	public String saveorder(HttpServletRequest request, Model model) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		if (null == user) {
			request.setAttribute("error", "Please log in before placing an order");

		}
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		OrderBean order = new OrderBean();
		order.setOrderDate(new Date());
		order.setTotal(cart.getTotal());
		order.setState(1);
		order.setId(user.getId()); 

	
		for (OrderItem item : cart.getOrderItems()) {
			OrderItemBean orderItem = new OrderItemBean();
			orderItem.setQuantity(item.getNum());
			orderItem.setTotal(item.getSubtotal());
			orderItem.setPdId(item.getProduct());
			orderItem.setOrder(order); 
			order.getItems().add(orderItem); //Add order one by one to avoid replacing the whole list

		}

		request.setAttribute("order", order);
		return "product/order";

	}

	@GetMapping("/checkout")
	public String checkout(HttpServletRequest request, Model model) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		if (null == user) {
			request.setAttribute("error", "Please log in before placing an order");

		}
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		OrderBean order = new OrderBean();

		order.setOrderDate(new Date());
		order.setTotal(cart.getTotal());
		order.setState(1);
		order.setId(user.getId());
		order.setEmail(request.getParameter("email"));
		order.setName(request.getParameter("name"));
		order.setPhone(request.getParameter("number"));
		order.setShippingAddress(request.getParameter("address"));
		
		Set<OrderItemBean> set = new HashSet<OrderItemBean>();
		for (OrderItem item : cart.getOrderItems()) {
			OrderItemBean orderItem = new OrderItemBean();
			orderItem.setQuantity(item.getNum());
			orderItem.setTotal(item.getSubtotal());
			orderItem.setPdId(item.getProduct());
//		    orderItem.setOrderId(order.getOrderId());  

			orderItem.setOrder(order); // Creat new order
//			order.getItems().add(orderItem); //all items
			set.add(orderItem);

		}
		order.setItems(set);
		odService.saveorder(order);

		cart.clearOrderItem();
		request.setAttribute("order", order);
		return "redirect:/backstage/pay/" + order.getOrderId();

	}

	@GetMapping("/createorder")
	public String createorder(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("number") String number, HttpServletRequest request, @RequestParam("address") String address,
			Model model) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		if (null == user) {
			request.setAttribute("error", "Please log in before placing an order");

		}
		// Get cart
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

		OrderBean order = new OrderBean();

		order.setOrderDate(new Date());
		order.setTotal(cart.getTotal());
		order.setState(1);
		order.setId(user.getId()); // User id
		order.setEmail(email);
		order.setName(name);
		order.setPhone(number);
		order.setShippingAddress(address);

		String recipient = email;
		String subject = "Your order";
		
		Set<OrderItemBean> set = new HashSet<OrderItemBean>();
		for (OrderItem item : cart.getOrderItems()) {
			OrderItemBean orderItem = new OrderItemBean();
			orderItem.setQuantity(item.getNum());
			orderItem.setTotal(item.getSubtotal());
			orderItem.setPdId(item.getProduct());
//		    orderItem.setOrderId(order.getOrderId());  

			orderItem.setOrder(order); 
//			order.getItems().add(orderItem); 
			set.add(orderItem);

		}
		order.setItems(set);
		System.out.println(set);
		odService.saveorder(order);
       

		cart.clearOrderItem();
		request.setAttribute("order", order);
		
		String content = "Hello, Here is your order number:" + order.getOrderId()+"\r\n";
	
		 StringBuilder stringBuilder =new StringBuilder();	  
		for (OrderItemBean orderItemBean : set) {
			stringBuilder.append("Product Name: ").append( orderItemBean.getPdId().getProductName()).append("\r\n");
			stringBuilder.append("Quantity:").append(orderItemBean.getQuantity()).append("\r\n");
			stringBuilder.append("Subtoyal: ").append(orderItemBean.getTotal()).append("\r\n");
		};
		content+=stringBuilder.toString()+"\r\n"+ "Order Total: "+order.getTotal()+"\r\n"+"Please proceed to payment ";
		
     

        System.out.println(content);
     
		;


		try {
			EmailUtility.sendEmail(host, port, email1, name1, pass, recipient, subject, content);
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/product/findorder1";

	}

	

	@GetMapping("/findorder1")
	public String findorder1(HttpServletRequest request, Model model) {
		MemberBean user = (MemberBean) request.getSession().getAttribute("MemberBean");
		String uid = user.getId();

		List<OrderBean> orders = odService.findorder(uid);

		model.addAttribute("order", orders);

		return "product/myorder1";

	}

	@GetMapping("/findorder/{oid}")
	public String findorder(@PathVariable("oid") Integer oid, HttpServletRequest request, Model model) {

		List<OrderItemBean> orderitem = odService.findorderdetail(oid);
		model.addAttribute("oitem", orderitem);

		return "product/myorder";

	}

}
