package com.iiiproject.lab02.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiproject.lab02.dao.IMemberDao;
import com.iiiproject.lab02.model.MemberBean;

//實作介面或繼承父類別,程式使用時直接寫父類別/介面名稱
@Repository (value = "memberDao")
public class MemberDao implements IMemberDao {
	@Autowired
	private SessionFactory factory;

	public MemberDao() {

	}



	@Override
	public boolean isDup(String id) {

		try {
			Session session=factory.getCurrentSession();
			String hql = "from MemberBean where id = :id";

			Query<MemberBean> query = session.createQuery(hql, MemberBean.class);
			query.setParameter("id", id);
			MemberBean resultUser = query.uniqueResult();
			if (resultUser != null) {
				return true;
			}
			return false;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public int insert(MemberBean mb) {
		int count = 0;
		try {
			Session session=factory.getCurrentSession();
			session.save(mb);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return count;
	}

	@Override
	public List<MemberBean> getAllMembers() {
		Session session=factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery("FROM MemberBean", MemberBean.class);
		return query.list();
				
		}

	@Override
	public MemberBean select(String id) {
		MemberBean mb=null;
try {		
			
	        System.out.println("dao:"+id);
			
	        String hql = "from MemberBean where id = :id";
			Session session=factory.getCurrentSession();
			Query<MemberBean> query= session.createQuery(hql,MemberBean.class);
			query.setParameter("id", id);
			mb = query.uniqueResult();
			
			
			
			
		 
			}catch (Exception ex) {
				ex.printStackTrace();
		
			} return mb;
	}


	@Override
	public int deleteMember(String id) {
		
		int count = 0;
		try {
			Session session=factory.getCurrentSession();
			String hql = "delete from MemberBean where id=:id";
			Query<MemberBean>  query = session.createQuery(hql);
			query.setParameter("id", id);
			query.executeUpdate();
			count=1;
			
			
			} catch (Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateMember(MemberBean mb) {
		int count = 0;
		try {
			Session session=factory.getCurrentSession();
			String hql = "from MemberBean where id = :id";
			Query<MemberBean> query= session.createQuery(hql,MemberBean.class);
			query.setParameter("id", mb.getId());
			MemberBean result = query.uniqueResult();
			if(result!=null) {
				result.setName(mb.getName());
				result.setPassword(mb.getPassword());
				result.setEmail(mb.getEmail());
				result.setAge(mb.getAge());
				result.setGames(mb.getGames());
				result.setGender(mb.getGender());
				result.setStatus(mb.getStatus());
				result.setPicture(mb.getPicture());
//				
				session.update(result);
				count=1;
			}
			
		
					
			
		} catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return count;
	}



	@Override
	public MemberBean findByEmail(String email) {
		MemberBean mb=null;
		try {		
					
			        System.out.println("dao:"+email);
					
			        String hql = "from MemberBean where email = :email";
					Session session=factory.getCurrentSession();
					Query<MemberBean> query= session.createQuery(hql,MemberBean.class);
					query.setParameter("email", email);
					mb = query.uniqueResult();
					if(mb!=null) {
						System.out.println("資料庫有抓到");
					}else {
						System.out.println("資料庫沒抓到物件");
					}
					
					
					
				 
					}catch (Exception ex) {
						ex.printStackTrace();
				
					} return mb;
			}



	@Override
	public MemberBean findByGoogleID(String googleId) {
		try {
			Session session=factory.getCurrentSession();
			String hql = "from MemberBean where googleId = :googleId";

			Query<MemberBean> query = session.createQuery(hql, MemberBean.class);
			query.setParameter("googleId", googleId);
			MemberBean resultUser = query.uniqueResult();
			if (resultUser != null) {
				return resultUser;
			}
			return null;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	}
	
	
	
	
}
