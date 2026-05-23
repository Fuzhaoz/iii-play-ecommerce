package com.iiiproject.product.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.iiiproject.lab02.model.MemberBean;
// 本類別存放訂單資料
// @Component("OrderBean")
@Entity
@Table(name="Pdreply")
public class ReplyBean {
	
	@Id
	@Column(name="replyId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer replyId;  //訂單編號	
	@Column(name="id")
     String id;  //會員Id	
	@Column(name="pdId")
	Integer pdId; //產品
	@Column(name="name")
	String name; //評論人
	@Column(name="detail")
	String	detail; //內容	
	@Column(name="replyDate")
	Date  replyDate; //訂單生成日期 

	
	
	
	
	public ReplyBean() {
		super();
	}

	public ReplyBean(Integer replyId, String id, Integer pdId, String name, String detail, Date replyDate) {
		super();
		this.replyId = replyId;
		this.id = id;
		this.pdId = pdId;
		this.name = name;
		this.detail = detail;
		this.replyDate = replyDate;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getPdId() {
		return pdId;
	}

	public void setPdId(Integer pdId) {
		this.pdId = pdId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	

}