package com.iiiproject.product.dao;



import java.util.List;


import com.iiiproject.product.model.Productcollect;





public interface IPdColDao {

	Productcollect addcol(Productcollect collectBean);

	Boolean delecol(Integer pdId, Integer userId);

	List<Productcollect> getcol(Integer userId);

	Boolean ifcol(Integer pdId, Integer userId);
	
}
