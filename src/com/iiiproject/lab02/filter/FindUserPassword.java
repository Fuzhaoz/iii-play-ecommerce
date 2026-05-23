package com.iiiproject.lab02.filter;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Controller
public class FindUserPassword extends HandlerInterceptorAdapter {
	String requestURI;

	public FindUserPassword() {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			System.out.println("進入cookie攔截器");
			HttpServletRequest req = (HttpServletRequest) request;
			String cookieName = "";
			String user = "";
			String password = "";
			String rememberMe = "";
			// 取出瀏覽器送來的Cookie
			Cookie[] cookies = req.getCookies();
			if (cookies != null) { // 如果含有Cookie
				for (int i = 0; i < cookies.length; i++) { // 檢視每個Cookie
					cookieName = cookies[i].getName();
					if (cookieName.equals("user")) {
						// 找到user這個Cookie
						user = cookies[i].getValue();
						
					} else if (cookieName.equals("password")) {
						// 找到password這個Cookie
						password = cookies[i].getValue();
					} else if (cookieName.equals("rm")) {
						// 找到rm這個Cookie(rm: rememberMe)
						rememberMe = cookies[i].getValue();
					}
				}
			} else {
				return true;
			}
			// 將這三項資料存入request物件
			HttpSession session1 = req.getSession();
			session1.setAttribute("rememberMe", rememberMe);
			session1.setAttribute("user", user);
			session1.setAttribute("password", password);
			return true;
		}
		return true;
	}

}
