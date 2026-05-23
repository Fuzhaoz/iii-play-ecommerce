package com.iiiproject.product.model;


import java.io.Serializable;

import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("productBean")
@Entity
@Table(name="products")
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	
	private int productId;
	private String productNo;
	private String productName;
	private String category;
	private byte[] pdimg;	
	private byte[] pdimg1;	
	private byte[] pdimg2;
	private byte[] pdimg3;	
	private String fileName; 
	private Integer price;
	private Integer stock;
	private String companyName;
	private Timestamp pdate;
	private OrderItemBean itembean;
	private String pdEname;

	
	public ProductBean() {
		
	}
	

	public ProductBean(String productNo, String productName, String category, byte[] pdimg, Integer price, Integer stock,

			String companyName, Timestamp pdate ,String pdEname ) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.category = category;
		this.pdimg = pdimg;
		this.price = price;
		this.stock = stock;
		this.companyName = companyName;
		this.pdate = pdate;
		this.pdEname = pdEname;
	}

	
	public ProductBean(String productNo, String productName, String category, byte[] pdimg, Integer price, Integer stock,
			String companyName, Timestamp pdate  ) {

		super();
		this.productNo = productNo;
		this.productName = productName;
		this.category = category;
		this.pdimg = pdimg;
		this.price = price;
		this.stock = stock;
		this.companyName = companyName;
		this.pdate = pdate;
		
	}
	


	@Column(name = "pdEname")
	public String getPdEname() {
		return pdEname;
	}
	public void setPdEname(String pdEname) {
		this.pdEname = pdEname;

	}
	


	
	
	
	@Id
	@Column(name="pdId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
		public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name="pdimg")
	public byte[] getPdimg() {
		return pdimg;
	}
	public void setPdimg(byte[] pdimg) {
		this.pdimg = pdimg;
	}
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name="pdimg1")
	public byte[] getPdimg1() {
		return pdimg1;
	}

	public void setPdimg1(byte[] pdimg1) {
		this.pdimg1 = pdimg1;
	}
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name="pdimg2")
	public byte[] getPdimg2() {
		return pdimg2;
	}

	public void setPdimg2(byte[] pdimg2) {
		this.pdimg2 = pdimg2;
	}
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name="pdimg3")
	public byte[] getPdimg3() {
		return pdimg3;
	}

	public void setPdimg3(byte[] pdimg3) {
		this.pdimg3 = pdimg3;
	}

	@Column(name="pdno")
	public String getProductNo() {
		return productNo;
	}
	
	
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	
	@Column(name="pdname")
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(name="category")
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Column(name="price")
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	@Column(name="stock")
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	@Column(name="companyId")
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Column(name="filename")
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Column(name="pdate")
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	
	@javax.persistence.Transient
	public OrderItemBean getItembean() {
		return itembean;
	}
	@javax.persistence.Transient
	public void setItembean(OrderItemBean itembean) {
		this.itembean = itembean;
	}
	
	

	


	
}
