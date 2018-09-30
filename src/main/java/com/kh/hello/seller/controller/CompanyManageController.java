package com.kh.hello.seller.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.seller.model.service.SellerService;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;

@Controller
public class CompanyManageController {
	@Autowired
	private SellerService ss;
	
	@RequestMapping(value="addCompany.sell")
	public String addCompany(Registration r, Model model, @RequestParam(name="companyFile", required=false)MultipartFile comFile, @RequestParam(name="personalFile", required=false)MultipartFile perFile){
		
		System.out.println("Registration : " + r);
		
		Company c=new Company();
		c.setcId(r.getcId());
		c.setContentId(r.getContentId());
		c.setSellerType(r.getSellerType());
		c.setCompanyNum(r.getCompanyNum());
		c.setPersonalNum(r.getPersonalNum());
		c.setCompanyName(r.getCompanyName());
		c.setCompanyPhone(r.getCompanyPhone());
		c.setCompanyAddress(r.getCompanyAddress());
		c.setmId(r.getmId());
		
		Room rm=new Room();
		rm.setrId(r.getrId());
		rm.setRoomType1(r.getRoomType1());
		rm.setRoomCount1(r.getRoomCount1());
		rm.setRoomPrice1(r.getRoomPrice1());
		rm.setRoomPeople1(r.getRoomPeople1());
		rm.setRoomType2(r.getRoomType2());
		rm.setRoomCount2(r.getRoomCount2());
		rm.setRoomPrice2(r.getRoomPrice2());
		rm.setRoomPeople2(r.getRoomPeople2());
		rm.setRoomType3(r.getRoomType3());
		rm.setRoomCount3(r.getRoomCount3());
		rm.setRoomPrice3(r.getRoomPrice3());
		rm.setRoomPeople3(r.getRoomPeople3());
		rm.setcId(r.getcId());
		
		RegistrationHistory rh=new RegistrationHistory();
		rh.setcId(r.getcId());
		rh.setTerm(r.getTerm());
		rh.setStatus(r.getStatus());
		
		System.out.println("Company : " + c);
		System.out.println("Room : " + rm);
		System.out.println("RegistrationHistory : " + rh);
		
		/*ss.insertCompany(c);
		ss.insertRoom(rm);
		ss.insertRH(rh);*/
		
		return "seller/sellerMain";
	}
}
