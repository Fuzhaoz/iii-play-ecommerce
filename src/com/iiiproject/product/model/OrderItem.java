package com.iiiproject.product.model;
//本類別封裝單筆訂單資料




public class OrderItem {
	private ProductBean product;
	private int num;
	private int subtotal;
	
	
	
	
	public OrderItem() {
		super();
	}
	
	
	public OrderItem(ProductBean product, int num, int subtotal) {
		super();
		this.product = product;
		this.num = num;
		this.subtotal = subtotal;
	}


	public ProductBean getProduct() {
		return product;
	}
	public void setProduct(ProductBean product) {
		this.product = product;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSubtotal() {
		return product.getPrice()*num;
	}
	
		
	

		
}