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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.iiiproject.lab02.model.MemberBean;

@Component("productcollect")
@Entity
@Table(name="pdcollect")
public class Productcollect implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="colId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer colId;
	
	@ManyToOne
	@JoinColumn(name=" mId")   
	private MemberBean memberBean;
	@ManyToOne
	@JoinColumn(name=" pdId")
	private ProductBean pdBean;
	
	@Column(name="coldate")
	private Timestamp coldate;;
	
	
	
	
	public Timestamp getColdate() {
		return coldate;
	}


	public void setColdate(Timestamp coldate) {
		this.coldate = coldate;
	}


	public Productcollect() {
		
	}


	public Integer getColId() {
		return colId;
	}


	public void setColId(Integer colId) {
		this.colId = colId;
	}


	public MemberBean getMemberBean() {
		return memberBean;
	}


	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


	public ProductBean getPdBean() {
		return pdBean;
	}


	public void setPdBean(ProductBean pdBean) {
		this.pdBean = pdBean;
	}
	
	


	
}
