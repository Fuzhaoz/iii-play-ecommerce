  package com.iiiproject.product.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
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

public class PageModel {
	//當前頁中商品訊息
	private List list =new ArrayList(); 
	private int pagesize ; //每一頁多少條紀錄
	private int actualpagesize; //實際每頁多少項商品 ex最後一頁 不一定滿
	private int page;//當前第幾頁
	private int totalpage;//總共多少頁
	private int totalnum;//總共多少條紀錄
	

}