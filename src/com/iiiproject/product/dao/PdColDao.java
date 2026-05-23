package com.iiiproject.product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.iiiproject.product.model.OrderBean;
import com.iiiproject.product.model.OrderItemBean;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.model.Productcollect;

@Repository("PdColDao")
public class PdColDao implements IPdColDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public Productcollect addcol(Productcollect collectBean) {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Productcollect> query = session.createQuery("FROM Productcollect where mId =?1 and pdId=?2 ",
Productcollect.class);
		query.setParameter(1,collectBean.getMemberBean());
		query.setParameter(2,collectBean.getPdBean());
		System.out.println("====null" +query);
		if (query.uniqueResult() == null) {
			System.out.println("存入" );
			session.save(collectBean);
	
		}
		System.out.println("不存入" );
		return null;

	}

	@Override
	public List<Productcollect> getcol(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		Query<Productcollect> query = session.createQuery("FROM Productcollect where mId =?1 ORDER BY coldate Desc",
				Productcollect.class);
		query.setParameter(1, userId);
		return query.list();

	}

	@Override
	public Boolean delecol(Integer pdId, Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Productcollect where pdId=?1 and mId=?2";
		Query<?> query = session.createQuery(hql);
		query.setParameter(1, pdId);
		query.setParameter(2, userId);
		Productcollect colBean = (Productcollect) query.uniqueResult();
		if (colBean != null) {
			session.delete(colBean);
			return true;
		}
		return false;

	}

	@Override
	public Boolean ifcol(Integer pdId, Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Productcollect where pdId=?1 and mId=?2";
		Query<?> query = session.createQuery(hql);
		query.setParameter(1, pdId);
		query.setParameter(2, userId);

		if (query.uniqueResult() != null) {
			
			return true;
		}
		
		return false;
	}
}
