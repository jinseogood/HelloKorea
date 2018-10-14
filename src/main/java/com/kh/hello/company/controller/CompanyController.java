package com.kh.hello.company.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hello.company.model.service.CompanyService;
import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Room2;
import com.kh.hello.member.model.vo.Member;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cs;
	
	@RequestMapping(value="searchHotelAreaPage.com")
	public void searchHotelAreaPage(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode,@ RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		Company2 cp = new Company2();
		cp.setAreaCode(areaCode);
		cp.setSigunguCode(sigunguCode);
		if(areaCode == 1){
			cp.setAreaName("서울");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("강남구");
			}else if(sigunguCode == 2){
				cp.setSigunguName("강동구");
			}else if(sigunguCode == 3){
				cp.setSigunguName("강북구");
			}else if(sigunguCode == 4){
				cp.setSigunguName("강서구");
			}else if(sigunguCode == 5){
				cp.setSigunguName("관악구");
			}else if(sigunguCode == 6){
				cp.setSigunguName("광진구");
			}else if(sigunguCode == 7){
				cp.setSigunguName("구로구");
			}else if(sigunguCode == 8){
				cp.setSigunguName("금천구");
			}else if(sigunguCode == 9){
				cp.setSigunguName("노원구");
			}else if(sigunguCode == 10){
				cp.setSigunguName("도봉구");
			}else if(sigunguCode == 11){
				cp.setSigunguName("동대문구");
			}else if(sigunguCode == 12){
				cp.setSigunguName("동작구");
			}else if(sigunguCode == 13){
				cp.setSigunguName("마포구");
			}else if(sigunguCode == 14){
				cp.setSigunguName("서대문구");
			}else if(sigunguCode == 15){
				cp.setSigunguName("서초구");
			}else if(sigunguCode == 16){
				cp.setSigunguName("성동구");
			}else if(sigunguCode == 17){
				cp.setSigunguName("성북구");
			}else if(sigunguCode == 18){
				cp.setSigunguName("송파구");
			}else if(sigunguCode == 19){
				cp.setSigunguName("양천구");
			}else if(sigunguCode == 20){
				cp.setSigunguName("영등포구");
			}else if(sigunguCode == 21){
				cp.setSigunguName("용산구");
			}else if(sigunguCode == 22){
				cp.setSigunguName("은평구");
			}else if(sigunguCode == 23){
				cp.setSigunguName("중구");
			}else if(sigunguCode == 24){
				cp.setSigunguName("중랑구");
			}else if(sigunguCode == 25){
				cp.setSigunguName("강북");
			}
		}else if(areaCode == 2){
			cp.setAreaName("인천");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("강화군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("계양구");
			}else if(sigunguCode == 3){
				cp.setSigunguName("남구");
			}else if(sigunguCode == 4){
				cp.setSigunguName("남동구");
			}else if(sigunguCode == 5){
				cp.setSigunguName("동구");
			}else if(sigunguCode == 6){
				cp.setSigunguName("부평구");
			}else if(sigunguCode == 7){
				cp.setSigunguName("서구");
			}else if(sigunguCode == 8){
				cp.setSigunguName("연수구");
			}else if(sigunguCode == 9){
				cp.setSigunguName("옹진군");
			}else if(sigunguCode == 10){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 3){
			cp.setAreaName("대전");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("대덕구");
			}else if(sigunguCode == 2){
				cp.setSigunguName("동구");
			}else if(sigunguCode == 3){
				cp.setSigunguName("서구");
			}else if(sigunguCode == 4){
				cp.setSigunguName("유성구");
			}else if(sigunguCode == 5){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 4){
			cp.setAreaName("대구");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("남구");
			}else if(sigunguCode == 2){
				cp.setSigunguName("달서구");
			}else if(sigunguCode == 3){
				cp.setSigunguName("달성군");
			}else if(sigunguCode == 4){
				cp.setSigunguName("동구");
			}else if(sigunguCode == 5){
				cp.setSigunguName("북구");
			}else if(sigunguCode == 6){
				cp.setSigunguName("서구");
			}else if(sigunguCode == 7){
				cp.setSigunguName("수성구");
			}else if(sigunguCode == 8){
				cp.setSigunguName("중구");
			}
		}
		ArrayList<Company2> list = cs.selectAllCompany(cp);
		response.getWriter().print(mapper.writeValueAsString(list));
//		ArrayList<Company2> list = cs.selectAllCompany(cp);
//		System.out.println(list);
//		response.setContentType("application/json");
//		response.getWriter().println(list);
	}
	
	
	@RequestMapping(value="detailRoom.com")
	public void detailRoom(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid, @RequestParam int cid) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		Room2 roomList = new Room2();
		roomList.setCid(cid);
		
		ArrayList<Room2> list = cs.selectRoomList(roomList);
		response.getWriter().print(mapper.writeValueAsString(list));
	}
	
	
	@RequestMapping(value="reservationRoom.com")
	public String reservationRoom(HttpServletRequest request, HttpServletResponse response, @RequestParam int rid, @RequestParam int price, @RequestParam String rType, @RequestParam int count, @RequestParam int limit) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		System.out.println("resrvation rid : " + rid);
		System.out.println("reservation price : " + price);
		System.out.println("reservation rType : " + rType);
		System.out.println("reservation count : " + count);
		System.out.println("reservation limit : " + limit);
		System.out.println("reservation user : " + userNo);
		
		Reservation2 reservation = new Reservation2();
		reservation.setPaId(userNo);
		reservation.setPeople(limit);
		reservation.setoRcount(count);
		reservation.setRid(rid);
		
		reservation = cs.insertReservation(reservation);
		
		return "payment/detailPayment";
	}
	
	
	
	
	
}
