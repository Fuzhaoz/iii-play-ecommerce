package com.iiiproject.lab02.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;

import com.google.api.client.json.jackson2.JacksonFactory;
import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.lab02.service.IMemberService;

@Controller

public class GoogleSign {
	
	@Autowired
	private IMemberService mService;
	
	@RequestMapping(path="googleMember")
		public String member() {
			
			
			return "member/googleMember";
		
	}
	
	
	@RequestMapping(path="googleLogOut")
	public String out(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session1 = request.getSession();
		session1.invalidate();
		
		return "redirect:/";
	}
	
	
	@RequestMapping (path="googleSign")
	public String Sign(HttpServletRequest request,HttpServletResponse response) throws GeneralSecurityException, IOException {
		
		
		String idTokenString=request.getParameter("idtoken");
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance())
			    // Specify the CLIENT_ID of the app that accesses the backend:
			    .setAudience(Collections.singletonList("684766344068-k68l406h041ql6qcfbeq7v312gv82ou6.apps.googleusercontent.com"))
			    // Or, if multiple clients access the backend:
			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
			    .build();

			// (Receive idTokenString by HTTPS POST)

			GoogleIdToken idToken = verifier.verify(idTokenString);
			if (idToken != null) {
			  Payload payload = idToken.getPayload();

			  // Print user identifier
			  String googleId = payload.getSubject();
			  System.out.println("User ID: " + googleId);

			  // Get profile information from payload
			  String email = payload.getEmail();
			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			  String name = (String) payload.get("name");
			  String pictureUrl = (String) payload.get("picture");
			  String locale = (String) payload.get("locale");
			  String familyName = (String) payload.get("family_name");
			  String givenName = (String) payload.get("given_name");
			  System.out.println("name: " + name);
			  System.out.println("email: " + email);
			  System.out.println("pictureUrl: " + pictureUrl);
			  HttpSession session1 = request.getSession();
	  
			  
			  
			  
			  if(mService.findByGoogleID(googleId)!=null) {
				  System.out.println("此google帳號已經註冊過");
				  MemberBean googleUser= mService.findByGoogleID(googleId);
				  System.out.println("資料庫抓到的姓名:"+googleUser.getName());
				  session1.setAttribute("googleUser", googleUser);
				  session1.setAttribute("googlePicture", pictureUrl);
				  
				  return "redirect:/";
			  }
			  
			  
			  MemberBean googleUser= new MemberBean();
			  googleUser.setEmail(email);
			  googleUser.setName(name);
			  googleUser.setGoogleId(googleId);
			  googleUser.setId(email);
			  googleUser.setPassword("default");
			  session1.setAttribute("googleUser", googleUser);
			  session1.setAttribute("googlePicture", pictureUrl);
			  mService.insert(googleUser);
			  
			  
			  // Use or store profile information
			  // ...
			  return "redirect:/";
			} else {
			  System.out.println("Invalid ID token.");
			  return "redirect:/";
			}
		
		
		
		
	}
	
	
}
