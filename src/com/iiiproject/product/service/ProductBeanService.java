package com.iiiproject.product.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiproject.product.dao.ProductDao;
import com.iiiproject.product.model.LikeBean;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.model.ProductBeanView;

@Service("ProductBeanService")
@Transactional
public class ProductBeanService implements IProductBeanService {

	
	@Autowired @Qualifier("productDao")
	private ProductDao hDao;
	
	public ProductBeanService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public ProductBean select(int productId) {
		
		return hDao.select(productId);
	}
	
	@Override
	public List<ProductBean> selecttype(String type) {
		
		return hDao.selecttype(type);
	}
	@Override
	public List<ProductBean> searchByKeyword(String keyword){
		
		return hDao.searchByKeyword(keyword);
	}
	@Override
	public List<ProductBean> searchpdname(String type) {
		
		return hDao.searchpdname(type);
	}
	@Override
	public ProductBean insert(ProductBean productBean) {
		// TODO Auto-generated method stub
		return hDao.insert(productBean);
	}

	@Override
	public Boolean delete(int productId) {
		// TODO Auto-generated method stub
		return hDao.delete(productId);
	}

	@Override
	public ProductBean update(int productId, String productNo, String productName, int price) {
		// TODO Auto-generated method stub
		return hDao.update(productId, productNo, productName, price);
	}

	@Override
	public List<ProductBean> selectAll() {
		// TODO Auto-generated method stub
		return hDao.selectAll();
	}
	
	@Override
	public byte[] loadimage(int ProductId) {
		// TODO Auto-generated method stub
		return hDao.loadimage(ProductId);
	}
	
	@Override
	public List<ProductBean> query(String num ,String content){
		return hDao.query(num, content);
	}
	@Override
	public List<ProductBean> newpd() {
		// TODO Auto-generated method stub
		return hDao.newpd();
	}
	@Override
	public List<ProductBean> type(String type) {
		// TODO Auto-generated method stub
		return hDao.type(type);
	}
	@Override
	public List<ProductBean> category(String com) {
		// TODO Auto-generated method stub
		return hDao.category(com);
	}
	
	@Override
	public Long allpdcount() {
	return hDao.allpdcount();
	}
	@Override
	public Long typepdcount(String type) {
	return hDao.typepdcount(type);
	}
	@Override
	public Long catepdcount(String cate) {
	return hDao.catepdcount(cate);
	}
	
	
	@Override
	public List<ProductBean> queryprice(int price1, int price2){
		return hDao.queryprice(price1, price2);
	}
	@Override
	public List<ProductBeanView> selectHot(){
		return hDao.selectHot();
	}
	@Override
	public byte[] loadimage1(int ProductId) {
		// TODO Auto-generated method stub
		return hDao.loadimage1(ProductId);
	}
	
	@Override
	public byte[] loadimage2(int ProductId) {
		// TODO Auto-generated method stub
		return hDao.loadimage2(ProductId);
	}
	@Override
	public byte[] loadimage3(int ProductId) {
		// TODO Auto-generated method stub
		return hDao.loadimage3(ProductId);
	}

	@Override
	public ProductBean updateProduct(ProductBean pb) {
		return hDao.updateProduct(pb);

}
	
	@Override
	public List<Map> maylike(String userId) {
		return hDao.maylike(userId);

}
	
	@Override
	public List<ProductBean> category1(Object object) {
		// TODO Auto-generated method stub
		return hDao.category1(object);
	}
	
}
