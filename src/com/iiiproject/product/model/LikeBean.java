package com.iiiproject.product.model;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component("LikeBean")
@Entity
@Table(name = "mayLike")
public class LikeBean {

	
	@Id
	@Column(name = "pdId")
	private Integer pdId;

	@Column(name = "id")
	private String id;

	@Column(name = "companyId")
	private String companyId;

	@Column(name = "total")
	private Integer total;

	public Integer getPdId() {
		return pdId;
	}

	public void setPdId(Integer pdId) {
		this.pdId = pdId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	
	
	
}