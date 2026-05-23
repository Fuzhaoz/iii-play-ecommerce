package com.iiiproject.text.model;


import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;



@Component("text1")
@Entity
@Table(name="USER_PROFILE")
public class text1 implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "USER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int uId;
	
	@Column(name = "USER_NAME")
	private String uname;
	
	@Column(name = "USER_SEX")
	private String usex;
	
	@Column(name = "USER_PHONE")
	private String uphone;
	
	@Column(name = "USER_ADDRESS")
	private String uaddress; 
	

	public text1() {
	}
	
	

	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	


	
	
	

	


	
}
