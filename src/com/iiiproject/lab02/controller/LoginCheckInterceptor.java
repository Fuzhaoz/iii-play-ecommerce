package com.iiiproject.lab02.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1、如果使用者已經登入 放行
        if(request.getSession().getAttribute("MemberBean") != null){
            return true;
        }else {
            //2、非法請求 即這些請求需要登入後才能訪問,重定向到登入頁面
            response.sendRedirect(request.getContextPath()+"/login.do");
            return false;
        }
    }
}
