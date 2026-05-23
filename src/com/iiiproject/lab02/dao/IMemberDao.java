package com.iiiproject.lab02.dao;

import java.util.List;

import com.iiiproject.lab02.model.MemberBean;

public interface IMemberDao {

	boolean isDup(String id);

	int insert(MemberBean mb);
//	
	MemberBean select(String id);
	
	MemberBean findByEmail(String email);
	
	MemberBean findByGoogleID(String googleId);
//
	int updateMember(MemberBean mb);
	int deleteMember(String id);
	List<MemberBean> getAllMembers();
//
//	MemberBean getMember(int pk);
//
//

}