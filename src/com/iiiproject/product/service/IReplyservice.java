package com.iiiproject.product.service;

import java.util.List;


import com.iiiproject.product.model.ReplyBean;

public interface IReplyservice {
	ReplyBean insertReply(ReplyBean rBean);
	List<ReplyBean> getReplyPd(Integer PdId);
	public Boolean deleteRp(Integer replyId);
	ReplyBean queryRp(Integer replyId);
}
