package com.iiiproject.product.service;

import java.util.List;

import com.iiiproject.product.model.Productcollect;


public interface IPdColservice {
	Productcollect addcol(Productcollect collectBean);

	Boolean delecol(Integer pdId, Integer userId);
	List<Productcollect> getcol(Integer userId);
	Boolean ifcol(Integer pdId, Integer userId);
}
