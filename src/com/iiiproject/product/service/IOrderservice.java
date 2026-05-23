package com.iiiproject.product.service;

import java.util.List;

import com.iiiproject.product.model.OrderBean;
import com.iiiproject.product.model.OrderItemBean;
import com.iiiproject.product.model.ProductBean;

public interface IOrderservice {
	public OrderBean saveorder(OrderBean order);

	public List<OrderBean> findorder(String uid);

		List<OrderItemBean> findorderdetail(Integer orderId);
		OrderBean state(Integer orderId);
}
