package com.kh.hello.seller.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.CommonUtils;
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
	public String addCompany(Registration r, Model model, HttpServletRequest request, @RequestParam(name="companyFile", required=false)MultipartFile companyFile, @RequestParam(name="personalFile", required=false)MultipartFile personalFile){
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root + "\\uploadFiles\\seller";
		
		System.out.println("file : " + personalFile);
		
		//사업자등록증 파일
		String originPerFileName=personalFile.getOriginalFilename();
		String perExt=originPerFileName.substring(originPerFileName.lastIndexOf("."));
		String changePerName=CommonUtils.getRandomString();
		
		//법인사업자등록증 파일
		String originComFileName="";
		String comExt="";
		String changeComName="";
		
		if(!r.getCompanyNum().equals("")){
			originComFileName=companyFile.getOriginalFilename();
			comExt=originComFileName.substring(originComFileName.lastIndexOf("."));
			changeComName=CommonUtils.getRandomString();
		}
		
		try {
			personalFile.transferTo(new File(filePath + "\\" + changePerName + perExt));
			if(!originComFileName.equals("")){
				companyFile.transferTo(new File(filePath + "\\" + changeComName + comExt));
			}
		
			System.out.println("Registration : " + r);
			
			//Company
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
			
			ss.insertCompany(c);
			
			//Room
			if(!r.getRoomType2().equals("")){
				if(!r.getRoomType3().equals("")){
					Room rm=new Room();
					rm.setrId(r.getcId());
					rm.setRoomType(r.getRoomType1());
					rm.setRoomCount(r.getRoomCount1());
					rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
					rm.setRoomPeople(r.getRoomPeople1());
					rm.setrId(r.getrId());
					
					ss.insertRoom1(rm);
					
					Room rm2=new Room();
					rm2.setrId(r.getcId());
					rm2.setRoomType(r.getRoomType2());
					rm2.setRoomCount(r.getRoomCount2());
					rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
					rm2.setRoomPeople(r.getRoomPeople2());
					rm2.setrId(r.getrId());
					
					ss.insertRoom2(rm2);
					
					Room rm3=new Room();
					rm3.setrId(r.getcId());
					rm3.setRoomType(r.getRoomType3());
					rm3.setRoomCount(r.getRoomCount3());
					rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
					rm3.setRoomPeople(r.getRoomPeople3());
					rm3.setrId(r.getrId());
					
					ss.insertRoom3(rm3);
					
				}
				else{
					Room rm=new Room();
					rm.setrId(r.getcId());
					rm.setRoomType(r.getRoomType1());
					rm.setRoomCount(r.getRoomCount1());
					rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
					rm.setRoomPeople(r.getRoomPeople1());
					rm.setrId(r.getrId());
					
					ss.insertRoom1(rm);
					
					Room rm2=new Room();
					rm2.setrId(r.getcId());
					rm2.setRoomType(r.getRoomType2());
					rm2.setRoomCount(r.getRoomCount2());
					rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
					rm2.setRoomPeople(r.getRoomPeople2());
					rm2.setrId(r.getrId());
					
					ss.insertRoom2(rm2);
				}
			}
			else{
				Room rm=new Room();
				rm.setrId(r.getcId());
				rm.setRoomType(r.getRoomType1());
				rm.setRoomCount(r.getRoomCount1());
				rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
				rm.setRoomPeople(r.getRoomPeople1());
				rm.setrId(r.getrId());
				
				ss.insertRoom1(rm);
			}
			
			//RH
			RegistrationHistory rh=new RegistrationHistory();
			rh.setcId(r.getcId());
			rh.setTerm(r.getTerm());
			
			ss.insertRH(rh);
		}
		catch (Exception e) {
			new File(filePath + "\\" + changePerName + perExt).delete();
			if(!originComFileName.equals("")){
				new File(filePath + "\\" + changeComName + comExt).delete();
			}
			
			e.printStackTrace();
		}
		
		return "seller/sellerMain";
	}
}
