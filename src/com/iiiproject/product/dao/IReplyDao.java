package com.iiiproject.product.dao;



import java.util.List;


import com.iiiproject.product.model.ReplyBean;




public interface IReplyDao {
	ReplyBean insertReply(ReplyBean rBean);
	List<ReplyBean> getReplyPd(Integer PdId);
	Boolean deleteRp(Integer replyId);
	ReplyBean queryRp(Integer replyId);
}
