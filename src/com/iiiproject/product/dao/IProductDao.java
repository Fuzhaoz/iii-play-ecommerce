package com.iiiproject.product.dao;



import java.util.List;
import java.util.Map;

import com.iiiproject.product.model.LikeBean;
import com.iiiproject.product.model.ProductBean;
import com.iiiproject.product.model.ProductBeanView;




public interface IProductDao {
	ProductBean select(int productId);
	List<ProductBean> selecttype(String type);
	List<ProductBean> searchpdname(String type);
	List<ProductBean> searchByKeyword(String keyword);
	ProductBean insert(ProductBean productBean);
	Boolean delete(int productId);
	ProductBean update(int productId, String productNo, String productName, int price);
	List<ProductBean> selectAll();
    public List<ProductBean> query(String num ,String content); //
    public List<ProductBean> newpd(); //新商品
    List<ProductBean> type (String type); //類型
    List<ProductBean> category (String  com); //類型
	Long allpdcount(); //數量
	Long typepdcount(String type); //數量
	Long catepdcount(String cate); //廠牌
	List<ProductBean> queryprice(int price1, int price2); //價錢
	List<ProductBeanView> selectHot(); //熱門商品
	byte[] loadimage(int ProductId);
	byte[] loadimage3(int ProductId);
	byte[] loadimage2(int ProductId);
	byte[] loadimage1(int ProductId);
	ProductBean updateProduct(ProductBean pb);
	List<Map>  maylike(String userId); //可能喜歡
	List<ProductBean> category1(Object object);
}
