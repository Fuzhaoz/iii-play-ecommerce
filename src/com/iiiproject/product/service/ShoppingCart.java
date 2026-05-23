package com.iiiproject.product.service;

import java.util.*;

import com.iiiproject.product.model.OrderItem;



public class ShoppingCart {
	private int total; 

	Map<Integer, OrderItem> map = new HashMap<Integer, OrderItem>();

	public void addOrderItem(OrderItem orderItem) {

		int pid = orderItem.getProduct().getProductId();

		if (map.containsKey(pid)) {

			OrderItem oldItem = map.get(pid);
			oldItem.setNum(oldItem.getNum() + orderItem.getNum());
		} else {
			map.put(pid, orderItem);
		}

	}
	
	
	public void removeOrderItem(int pid) {
		map.remove(pid);
		
	}
	
	public void update(OrderItem orderItem) {
		int pid = orderItem.getProduct().getProductId();

		if (map.containsKey(pid)) {
			OrderItem oldItem = map.get(pid);
			oldItem.setNum(orderItem.getNum());
		} 

	}
	
	
	public void clearOrderItem() {
		map.clear();
		
	}
	public int getTotal() {
		total=0;
		Collection<OrderItem> values = map.values();
		
		//get all the items
		for(OrderItem orderItem:values) {
			
			total+=orderItem.getSubtotal();
		}
		return total;
		
	}
	public Collection<OrderItem> getOrderItems() {
		
	return map.values();
	}
	
	
	public void setTotal(int total) {
		this.total = total;
	}
	public Map<Integer, OrderItem> getMap() {
		return map;
	}
	public void setMap(Map<Integer, OrderItem> map) {
		this.map = map;
	}
	
	
}
