package com.iiiproject.lab02.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "MemberTest")
public class MemberBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int pk;
	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private String games;
	private Integer age;
	private Integer status;
	private byte[] picture;
	private Timestamp registerTime;
	private String googleId;
	
	
	public MemberBean() {
		
	}
	
	public MemberBean(String id, String password,String name ,String email,Integer age, String gender, String games,Integer status,byte[] picture, Timestamp registerTime) {
		super();
		this.id = id;
		this.password = password;
		this.name=name;
		this.email = email;
		this.gender = gender;
		this.games = games;
		this.age= age;
		this.status=status;
		this.picture=picture;
		this.registerTime=registerTime;
	}
	public MemberBean(String id, String password,String name ,String email,Integer age, String gender, String games,Integer status) {
		super();
		this.id = id;
		this.password = password;
		this.name=name;
		this.email = email;
		this.gender = gender;
		this.games = games;
		this.age= age;
		this.status=status;
		
	}
	public MemberBean(String id, String password,String name ,String email,Integer age, String gender, String games,Integer status,byte[] picture ) {
		super();
		this.id = id;
		this.password = password;
		this.name=name;
		this.email = email;
		this.gender = gender;
		this.games = games;
		this.age= age;
		this.status=status;
		this.picture=picture;
		
	}
	@Id
	@Column(name="pk")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}
	@Column(name="id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="age")
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="gender")
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Column(name="games")
	public String getGames() {
		return games;
	}
	public void setGames(String games) {
		this.games = games;
	}
	@Column(name="status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name="picture")
	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	@Column(name="registerTime")
	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}
	@Column(name="googleId")
	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}
	
	
}
