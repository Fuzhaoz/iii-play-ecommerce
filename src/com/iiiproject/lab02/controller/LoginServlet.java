package com.iiiproject.lab02.controller;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.lab02.service.IMemberService;



@Controller
public class LoginServlet {
	@Autowired
	private IMemberService mService;
	
	
	@RequestMapping(value={"login.do","forum/login.do"})
	
	public String toLogin() {
		return "member/login";
	}
	@RequestMapping(value="MemberUpdate")
	public String memberUpdate() {
		return "member/MemberUpdate";
	}
	
	
	@RequestMapping(value={"logOut","forum/logOut"},method = RequestMethod.GET)
	protected String logOutAction(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session1 = request.getSession();
		session1.invalidate();
		return "redirect:/";
	
	}
	
	@RequestMapping(value="checkLogin.do",method = RequestMethod.POST)
	protected String doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
		request.setCharacterEncoding("UTF-8");
		
		
		System.out.println("hello");
		HttpSession session1 = request.getSession();
		// 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "error"
		request.setAttribute("error", errorMsgMap);
		// 1. 讀取使用者輸入資料(<Input>標籤內的name屬性分別為 userId與pswd
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String rm = request.getParameter("rm");
		System.out.println(rm);
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println(gRecaptchaResponse);
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		// 如果 userId 欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
		// 對應的識別字串為 "AccountEmptyError"
		if (id == null || id.trim().length() == 0) {
			errorMsgMap.put("account", "帳號欄必須輸入");
			
		}
		// 如果 password 欄位為空白，放錯誤訊息"密碼欄必須輸入"到 errorMsgMap 之內
		// 對應的識別字串為 "PasswordEmptyError"
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("password", "密碼欄必須輸入");
		}
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp，
		// 然後 return
		if (!errorMsgMap.isEmpty()) {
			return "member/login";
		}
		// **********Remember Me****************************
				Cookie cookieUser = null;
				Cookie cookiePassword = null;
				Cookie cookieRememberMe = null;
				// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
				if (rm != null) {
					cookieUser = new Cookie("user", id);
					cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
					cookieUser.setPath(request.getContextPath());

					
					cookiePassword = new Cookie("password", password);
					cookiePassword.setMaxAge(7 * 24 * 60 * 60);
					cookiePassword.setPath(request.getContextPath());

					cookieRememberMe = new Cookie("rm", "true");
					cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
					cookieRememberMe.setPath(request.getContextPath());
				} else { // 使用者沒有對 RememberMe 打勾
					System.out.println("使用者沒有對 RememberMe 打勾");
					cookieUser = new Cookie("user", id);
					cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
					cookieUser.setPath(request.getContextPath());
					
					
					cookiePassword = new Cookie("password", password);
					cookiePassword.setMaxAge(0);
					cookiePassword.setPath(request.getContextPath());

					cookieRememberMe = new Cookie("rm", "true");
					cookieRememberMe.setMaxAge(0);
					cookieRememberMe.setPath(request.getContextPath());
				}
				response.addCookie(cookieUser);
				response.addCookie(cookiePassword);
				response.addCookie(cookieRememberMe);
		// 4. 進行 Business Logic 運算
		// 將LoginService類別new為物件，存放物件參考的變數為 ls
		
		// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數
		// 同時將傳回值放入MemberBean型別的變數mb之內。
		MemberBean mb = mService.checkIDPassword(id, password);
		
		
		
		
		// 如果變數mb的值不等於 null,表示資料庫含有userId搭配password的紀錄
		if (mb != null) {
			// OK, 將mb物件放入Session範圍內，識別字串為"MemberBean"，表示此使用者已經登入
			String codedPassword=mb.getPassword();
			String key = "kittymickysnoopy"; // 對稱式金鑰
			
			byte[] imageBytes = mb.getPicture();
			if(imageBytes!=null) {
			String imgb64 = Base64.getEncoder().encodeToString(imageBytes);
			session1.setAttribute("mbPic", imgb64);
			}
			// decryptString(key, cipherText, iv) : 將密文還原為明文
			String decodedPassword = CipherUtils.decryptString(key, codedPassword);
			mb.setPassword(decodedPassword);
			String user = mb.getId();
			session1.setAttribute("MemberBean", mb);
		} else {
			// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內
			// 對應的識別字串為 "LoginError"
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式
		if (errorMsgMap.isEmpty()&&verify) {
			
			return "redirect:/";
		} else {
			if(verify==false) {
				errorMsgMap.put("robot", "請點選我不是機器人");
			}
			// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp
			
			return "member/login";
		}
	}
}
