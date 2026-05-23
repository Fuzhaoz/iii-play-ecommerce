   package com.iiiproject.text.dao;





import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.iiiproject.text.model.text1;





@Repository("TextDao")
public class TextDao implements ITextDao {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	

	
	@Override
	public text1 finduser(String uId,String uphone,String usex) {
		Session session = sessionFactory.getCurrentSession();
		Query<text1> queryuser =session.createQuery("from text1 where USER_NAME=?0 and USER_SEX=?1 and USER_PHONE=?2 ", text1.class);
		queryuser.setParameter(0, uId);
		queryuser.setParameter(1, usex);
		queryuser.setParameter(2, uphone);
	
		return queryuser.uniqueResult();
	}
	

}
