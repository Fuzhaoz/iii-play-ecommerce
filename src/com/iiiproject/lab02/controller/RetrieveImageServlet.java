 package com.iiiproject.lab02.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.lab02.service.IMemberService;





@Controller
public class RetrieveImageServlet {
	@Autowired
	IMemberService mService;
	
	
	@RequestMapping (path = "/member/getImage/{memberId}")
	protected void doGet(@PathVariable("memberId") String memberID,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		OutputStream os = null;
		InputStream is = null;
		
		String mimeType = null;
		
		try {
			// 讀取瀏覽器傳送來的主鍵
			
						
				
					MemberBean mb = mService.select(memberID);
					byte[] picture = mb.getPicture();
					if (picture != null) {
						
						is = new ByteArrayInputStream(picture);
						
						
					}
//				
//					 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
					if (picture == null) {
						
						
						is = request.getServletContext().getResourceAsStream(
								"/img/NoImage.png");
					}

			
			
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = "image/jpeg";
			// 設定輸出資料的MIME型態
			response.setContentType(mimeType);
			// 取得能寫出非文字資料的OutputStream物件
			os = response.getOutputStream();	
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} finally{
			if (is != null) 
				is.close();
			if (os != null) 
				os.close();
			
		}
	}
}