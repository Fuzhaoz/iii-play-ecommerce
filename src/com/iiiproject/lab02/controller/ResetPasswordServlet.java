package com.iiiproject.lab02.controller;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiproject.lab02.service.IMemberService;
 

@Controller
public class ResetPasswordServlet{
	@Autowired
	private IMemberService mService;
    
 
    private String host="smtp.gmail.com";
    private String port="587";
    private String email="ericeric4062@gmail.com";


    private String name="iiiPlay Administer";

    private String pass="ab123830205";
    
 
     
	@RequestMapping(path="forget")
	public String page() {
		return "member/forget";
	}
 
    @RequestMapping("sendEmail")
    protected String doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	
    	
    	String recipient = request.getParameter("email");
        String subject = "您的iiiPlay密碼已被重置";
        
        
        
        
        String newPassword = mService.resetCustomerPassword(recipient);
        String message = "";
        if (newPassword=="error") {
        	message = "找不到此信箱註冊的帳號，請重新輸入 ";
        	 request.setAttribute("message", message);
        			return "member/message";
        }
 
        String content = "你好，這是您的新密碼: " + newPassword;
        content += "\nNote: 為了安全理由， "

                 + "登入後請修改密碼"+"\r\n"+"此由iiiPlay系統自動發送，請勿回覆"
        		
                ;

 
 
        try {
            EmailUtility.sendEmail(host, port, email, name, pass,
                    recipient, subject, content);
            message = "Your password has been reset. Please check your e-mail.";
        } catch (Exception ex) {
            ex.printStackTrace();
            message = "找不到此信箱註冊的帳號，請重新輸入 " ;
        } finally {
            request.setAttribute("message", message);
                       
        } return "member/message";
    }
 
}
