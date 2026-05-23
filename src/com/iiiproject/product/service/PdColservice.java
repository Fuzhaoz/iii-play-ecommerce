package com.iiiproject.product.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiproject.product.dao.PdColDao;

import com.iiiproject.product.model.Productcollect;


@Service("PdColservice")
@Transactional
public class PdColservice implements IPdColservice {

	
	@Autowired @Qualifier("PdColDao")
	private PdColDao cDao;
	
	public PdColservice() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public Productcollect addcol(Productcollect collectBean) {
		
		Productcollect pdc =cDao.addcol(collectBean);
		
		return pdc;
	}
	
	@Override
	public Boolean delecol(Integer pdId, Integer userId) {
		
		Boolean pdc =cDao.delecol(pdId, userId);
		
		return pdc;
	}
	
	@Override
	 public List<Productcollect> getcol(Integer userId){
		
		List<Productcollect> pdc =cDao.getcol(userId);
		
		return pdc;
	}
	
	@Override
	public Boolean ifcol(Integer pdId, Integer userId) {
		
		Boolean ifcol=cDao.ifcol(pdId, userId);
		return ifcol;
	}
	
}
