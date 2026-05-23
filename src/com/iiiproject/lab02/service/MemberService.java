package com.iiiproject.lab02.service;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.text.RandomStringGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiproject.lab02.controller.CipherUtils;
import com.iiiproject.lab02.dao.MemberDao;
import com.iiiproject.lab02.model.MemberBean;

@Service(value = "memberService")
@Transactional

public class MemberService implements IMemberService {
	@Autowired
	private MemberDao mDao;

	public MemberService() {

	}

	@Override
	public boolean isDup(String id) {

		return mDao.isDup(id);
	}

	@Override
	public int insert(MemberBean mb) {

		return mDao.insert(mb);

	}

	public MemberBean checkIDPassword(String id, String password) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {

		// 透過變數dao，呼叫它的select()方法，要傳入參數 id。將傳回值放入變數
		// UserBean ub 內。
		
		MemberBean mb = mDao.select(id);
		if(mb==null) {
			return null;
		}
		String codedPassword = mb.getPassword();
		System.out.println("資料庫加密"+codedPassword);

		String key = "kittymickysnoopy"; // 對稱式金鑰
		
		// decryptString(key, cipherText, iv) : 將密文還原為明文
		String decryptedString = CipherUtils.decryptString(key, codedPassword);

		// 如果ub不等於 null 而且參數 password等於ub內的password) {
		if (mb != null && decryptedString.equals(password)) {
			// 傳回 ub物件，同時結束本方法
			return mb;
		}
		return null; // 傳回null物件
	}

//
	@Override
	public int updateMember(MemberBean mb) {

		return mDao.updateMember(mb);

	}

	@Override
	public List<MemberBean> getAllMembers() {
		
		return mDao.getAllMembers();
	}
//
//	@Override
//	public MemberBean getMember(int pk) {
//		//MemberHibernateDAO dao  = new MemberHibernateDAO();
//		MemberDao dao = new MemberJdbcDao();
//		return dao.getMember(pk);
//	}
//
	@Override
	public int deleteMember(String id) {
		// MemberHibernateDAO dao = new MemberHibernateDAO();
		return mDao.deleteMember(id);
	}

	public String resetCustomerPassword(String email) {
		MemberBean mb = mDao.findByEmail(email);

		char[][] pairs = { { 'a', 'z' }, { 'A', 'Z' }, { '0', '9' } };
		int length = 10;
		RandomStringGenerator generator = new RandomStringGenerator.Builder().withinRange(pairs).build();
		String randomPassword = generator.generate(length);
		System.out.println(randomPassword);

		if (mb == null) {
			randomPassword = "error";
		}

		if (mb != null) {
			String key = "kittymickysnoopy"; // 對稱式金鑰
			String codedPassword=CipherUtils.encryptString(key, randomPassword);
			mb.setPassword(codedPassword);
			mDao.updateMember(mb);
		}

		return randomPassword;
	}

	@Override
	public MemberBean findByGoogleID(String googleId) {
		// TODO Auto-generated method stub
		return mDao.findByGoogleID(googleId);
	}

	@Override
	public MemberBean select(String id) {
		return mDao.select(id);
	}

	
	
////
//	@Override
//	public int updateMember(MemberBean mb) {
//		//MemberHibernateDAO dao  = new MemberHibernateDAO();
//		MemberDao dao = new MemberJdbcDao();
//		return dao.updateMember(mb);
//	}

}
