package com.iiiproject.lab02.service;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.iiiproject.lab02.model.MemberBean;



public interface IMemberService {

	boolean isDup(String id);

	int insert(MemberBean mb);

	MemberBean checkIDPassword(String id, String password) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException;
//
//	int updateMember(MemberBean mb);
	
	String resetCustomerPassword(String email);

	List<MemberBean> getAllMembers();
//
//	MemberBean getMember(int pk);
//
	int deleteMember(String id);
//
	int updateMember(MemberBean mb);
	
	MemberBean findByGoogleID(String googleId);
	
	MemberBean select(String id);
	

}