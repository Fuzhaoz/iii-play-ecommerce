   package com.iiiproject.product.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.iiiproject.product.model.ReplyBean;





@Repository("ReplyDao")
public class ReplyDao implements IReplyDao {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	@Override
	public ReplyBean insertReply(ReplyBean rBean) {
		Session session = sessionFactory.getCurrentSession();
//		Reply resultBean = session.get(Reply.class, rBean.getReplyId());

//		if (resultBean == null) {
			session.save(rBean);
//		}
		return rBean;
	}
		

	@Override
	public List<ReplyBean> getReplyPd(Integer PdId) {
		Session session = sessionFactory.getCurrentSession();
		Query<ReplyBean> query = session.createQuery("FROM ReplyBean WHERE pdId =?1 ORDER BY replyDate DESC", ReplyBean.class);
		query.setParameter(1, PdId);
		return query.list();
		
	}
	@Override
	public Boolean deleteRp(Integer replyId) {
		Session session = sessionFactory.getCurrentSession();
		ReplyBean resultBean = session.get(ReplyBean.class, replyId);

		if (resultBean != null) {
			session.delete(resultBean);
			return true;
		}
		return false;
	}
	@Override
	public ReplyBean queryRp(Integer replyId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ReplyBean.class, replyId);
	}

}
