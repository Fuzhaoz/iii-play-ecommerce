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





@Repository("OrderDao")
public class OrderDao implements IOrderDao {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	@Override
	public void saveorder(OrderBean order) {
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
		
		
	}
	
	
	@Override
	public List<OrderBean> findorder(String uid) {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderBean> queryorder =session.createQuery("from OrderBean where id=?0 ", OrderBean.class);
		queryorder.setParameter(0, uid);
	
		return queryorder.list();
	}
	@Override
	public List<OrderItemBean> findorderdetail(Integer orderId) {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderItemBean> queryorderitem =session.createQuery("from OrderItemBean where FK_orderId=?0 ", OrderItemBean.class);
		queryorderitem.setParameter(0, orderId);
	
		return queryorderitem.list();
	}
	

	
	
	
	@Override
	public void saveorderItem(OrderItemBean Item) {
		Session session = sessionFactory.getCurrentSession();
		session.save(Item);
		
	}
			
	@Override
	public OrderBean state(Integer orderId) {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderBean> state =session.createQuery("from OrderBean where state=?0  ", OrderBean.class);
		state.setParameter(0, orderId);
	
		return state.uniqueResult();
	}		
	
	
			
	
	

}
