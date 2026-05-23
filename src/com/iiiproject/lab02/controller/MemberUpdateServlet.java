package com.iiiproject.lab02.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiproject.lab02.model.MemberBean;
import com.iiiproject.lab02.service.IMemberService;

@Controller
public class MemberUpdateServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IMemberService mService;
	
	
	@RequestMapping (value = "getAllMember")
	public String getAllMember(Model model) {
		List<MemberBean> list=mService.getAllMembers();
		model.addAttribute("memberList", list);
		return "member/memberList";
		
		
		
	}
	
	

	
	
	
	@GetMapping (path="/status/{memberId}")
	public String changeStatus(@PathVariable ("memberId")String memberId,HttpServletRequest request) {
		

		MemberBean updateMb = mService.select(memberId);
		System.out.println("測試:"+memberId);
		System.out.println(updateMb.getName());
		Integer status=updateMb.getStatus();
		System.out.println("status:"+status);
		if (status==1) {
			
			updateMb.setStatus(100);
			mService.updateMember(updateMb);
		}
		if (status==100) {
			updateMb.setStatus(1);
			mService.updateMember(updateMb);
		}
		
		return "redirect:/getAllMember";
	}
	
	
	
		

	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	protected String doPost(@RequestParam("changePic") MultipartFile multipartFile, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		System.out.println("hello");
		HttpSession session1 = request.getSession();
		Map<String, String> errorMsg = new HashMap<>();
		session1.setAttribute("error", errorMsg);
		String modify = request.getParameter("finalDecision");
		String id = request.getParameter("id");
		System.out.println("現在的帳號是" + id);

		System.out.println("modify=" + modify);

		int count = 0;
		if (modify.equalsIgnoreCase("UPDATE")) {

			String notCodePassword = request.getParameter("password");
			String key = "kittymickysnoopy"; // 對稱式金鑰
			String plainText = notCodePassword;
			String password = CipherUtils.encryptString(key, plainText);
			System.out.println(password);
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String[] gamesArray = request.getParameterValues("games");
			String games = String.join(",", gamesArray);
			System.out.println(games);
			String ageString = request.getParameter("age");
			Integer age = Integer.valueOf(ageString);
			if (multipartFile.isEmpty()) {
				System.out.println("沒有上傳圖片");
			}

			Integer status = 1;

			// 檢查輸入的資料
			if (id == null || id.trim().length() == 0) {
				errorMsg.put("id", "帳號不能空白");
			}
			if (password == null || password.trim().length() == 0) {
				errorMsg.put("password", "密碼欄不能空白");
			} else if (password.trim().length() < 6) {
				errorMsg.put("password", "密碼至少要6個字元");
			}
			if (name == null || name.trim().length() == 0) {
				errorMsg.put("name", "姓名欄不能空白");
			}
			if (email == null || email.trim().length() == 0) {
				errorMsg.put("email", "請輸入電子信箱地址");
			}
			if (ageString == null || ageString.trim().length() == 0) {
				errorMsg.put("age", "請輸入年齡");
			}
			// 如果輸入資料都正確,進行修改動作
			if (!errorMsg.isEmpty()) {
				return "member/MemberUpdate";
			}

			if (multipartFile.isEmpty()) {
				System.out.println("沒有上傳圖片");

				MemberBean mb = new MemberBean(id, password, name, email, age, gender, games, status);

				count = mService.updateMember(mb);
				session1.setAttribute("update", mb);
				if (count == 1) {
					session1.setAttribute("modify", "修改成功");
					return "member/UpdatedSuccess";

				} else {
					session1.setAttribute("modify", "修改時發生異常");
					return "member/MemberUpdate";
				}
			} else if (!multipartFile.isEmpty()) {
				System.out.println("有上傳新圖片");
				byte[] picture = multipartFile.getBytes();
				MemberBean mb = new MemberBean(id, password, name, email, age, gender, games, status, picture);
				count = mService.updateMember(mb);
				String imgb64 = Base64.getEncoder().encodeToString(picture);
				session1.setAttribute("mbPic", imgb64);
				session1.setAttribute("update", mb);
				if (count == 1) {
					session1.setAttribute("modify", "修改成功");
					return "member/UpdatedSuccess";

				} else {
					session1.setAttribute("modify", "修改時發生異常");
					return "member/MemberUpdate";
				}

			}
//			}

			//////////////////////////////////////////////////

		} else if (modify.equalsIgnoreCase("DELETE")) {

			System.out.println(id);
			count = mService.deleteMember(id);
			if (count == 1) {
				session1.setAttribute("modify", "刪除成功");
				return "login";

			} else {
				session1.setAttribute("modify", "刪除時發生異常");
				session1.removeAttribute("update");
				return "member/MemberUpdate";
			}
		}
		return "member/MemberUpdate";
	}
}
