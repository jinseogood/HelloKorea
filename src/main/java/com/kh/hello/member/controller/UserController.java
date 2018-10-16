package com.kh.hello.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.CommonUtils;
import com.kh.hello.member.model.service.MemberService;
import com.kh.hello.member.model.vo.BoardAndReply;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;

@Controller
@SessionAttributes("loginUser")
public class UserController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="userMypage.um")
	public String userMypage(Model model, HttpServletRequest request){
		
		 Member m=(Member)request.getSession().getAttribute("loginUser");
		
		int mId= m.getmId();
		
		System.out.println("mid : " + mId);
		
		Attachment a = ms.selectMemberProfile(mId);
		System.out.println("a"+a);
		if(a ==null){
			model.addAttribute("a", a);
			model.addAttribute("mId", mId);
			return "userMypage/editProfile";
		}else{
			//Attachment a1 = ms.selectMemberProfile1(mId);
			String changeName = a.getChangeName();
			
			model.addAttribute("a", a);
			model.addAttribute("changeName", changeName);
			return "userMypage/editProfile";
		}
		
		}
		 
	@RequestMapping(value="editProfile.um")
	public String editProfile(Model model, Member m ,
								HttpServletRequest request,@RequestParam(name="photo",required=false)MultipartFile photo){
		
		
		System.out.println("editProfile : " + m);
		
		int result = ms.editProfile(m);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root" + root);
		String filePath = root+"\\uploadFiles\\member";
		System.out.println("filePath :"+filePath);
		
		String originName = photo.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = CommonUtils.getRandomString();
		
		Attachment a = new Attachment();
		a.setOriginName(originName);
		a.setChangeName(changeName);
		a.setRefId(m.getmId());
		a.setFilePath(filePath);
		
		int result2 = ms.uploadprofile(a);
		
		try {
			photo.transferTo(new File(filePath +"\\"+changeName +ext));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(result >0){
			
			return "userMypage/editProfile";
			
		}else{
			return "common/errorPage";
		}
		
	}
	@RequestMapping(value="watchList.um")
	public String wachList(Model model,HttpServletRequest request){

		Member m=(Member)request.getSession().getAttribute("loginUser");
		
		
		int mId = m.getmId();
		System.out.println("마이페이지mId : "+mId);
		
		ArrayList<MemberGoods> goodsList = ms.selectGoodsList(mId);
		
		System.out.println("goodList : "+ goodsList);
		
		model.addAttribute("goodsList", goodsList);
		return "userMypage/watchList";
		
	}
	@RequestMapping(value="activities.um")
	public String activities(Model model,HttpServletRequest request){
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int mId = m.getmId();
		
		ArrayList<BoardAndReply> boreList = ms.selectboreList(mId);
		
		System.out.println("boreList : "+boreList);
		
		
		
		model.addAttribute("boreList", boreList);
		return  "userMypage/activities";
		
	}
}
