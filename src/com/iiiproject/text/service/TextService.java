package com.iiiproject.text.service;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiproject.text.dao.TextDao;
import com.iiiproject.text.model.text1;


@Service("Textservice")
@Transactional
public class TextService implements ITextService {

	
	@Autowired @Qualifier("TextDao")
	private TextDao tDao;
	
	public TextService() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public text1 finduser(String uId,String uphone,String usex){
		
		text1 tuser =tDao.finduser(uId,uphone,usex);
		
		return tuser;
	}
	
	
}
