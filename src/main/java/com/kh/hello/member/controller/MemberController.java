package com.kh.hello.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.service.MemberService;
import com.kh.hello.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired BCryptPasswordEncoder passwordEncoder;


	@RequestMapping(value ="insertUser.me")
	public String insertMember(Model model,Member m ){

		String encPassword = passwordEncoder.encode(m.getPassword());

		/*		System.out.println("암호화 : "+encPassword);*/
		m.setPassword(encPassword);


		int result = ms.insertMember(m);
		
		//유저시퀀스
		int mid = ms.selectMemberSequence();

		if(result >0){

			System.out.println("mid : " + mid);

			model.addAttribute("mid", mid);

			return "member/addUserInfo";

		}else{
			System.out.println("실패");
			return "main/main";
		}

	}

	@RequestMapping(value="insertSeller.me")
	public String insertSeller(Model model, Member m){

		String encPassword = passwordEncoder.encode(m.getPassword());

		/*System.out.println(m);*/

		int result = ms.insertSeller(m);
		
		int mid  = ms.selectSellerSequence();

		if(result > 0){
			System.out.println("mid seller :" + mid);
			model.addAttribute("mid", mid);
			return "member/addSellerInfo";
		}
		return null;
	}

	@RequestMapping(value="login.me")
	public String loginUser(Model model, Member m){

		try {
			model.addAttribute("loginUser", ms.loginMember(m));
			System.out.println("로그인 성공");

			return "main/main";
		} catch (LoginException e) {
			model.addAttribute("msg",e.getMessage());

			return "common/errorPage";
		}
	}
	@RequestMapping(value="addUser.me")
	public String updateAddUser(Model model, Member m){

		System.out.println("m : 이거다"+m);


		int result = ms.updateAddUser(m);

		if(result >0){
			return "main/main";


		}else{
			return"common/errorPage";

		}



	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="addSeller.me")
	public String updateAddSeller(Model model, Member m){
		
		System.out.println("m seller:"+m);
		int result = ms.updateAddSeller(m);
		
		if(result >0){
			return "main/main";
		}else{
			return "common/errorPage";
		}
		
		
		
	}

}
