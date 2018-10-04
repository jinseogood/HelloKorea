package com.kh.hello.good.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hello.good.model.service.GoodService;
import com.kh.hello.good.model.service.GoodServiceImpl;
import com.kh.hello.good.model.vo.Good;
import com.kh.hello.member.model.vo.Member;

@Controller
public class GoodController {
	@Autowired
	private GoodService gs;
	
	@RequestMapping(value="dibsHotel.good")
	public void selectDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("숙박");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
//		이미 찜한 목록이 있는지 확인
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="insertDibsHotel.good")
	public void insertDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("숙박");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.insertDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="deleteDibsHotel.good")
	public void deleteDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setOriginId(contentid);
		gg.setMid(userNo);
		
		result = gs.deleteDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	
	
	
	
	

}
