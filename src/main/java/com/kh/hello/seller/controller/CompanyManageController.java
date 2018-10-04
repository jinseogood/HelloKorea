package com.kh.hello.seller.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.CommonUtils;
import com.kh.hello.common.Pagination;
import com.kh.hello.common.PageInfo;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.seller.model.service.SellerService;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

@Controller
public class CompanyManageController {
	@Autowired
	private SellerService ss;
	
	//업체 등록
	@RequestMapping(value="addCompany.sell", method=RequestMethod.POST)
	public String addCompany(Registration r, Model model, HttpServletRequest request, @RequestParam(name="companyFile", required=false)MultipartFile companyFile, @RequestParam(name="personalFile")MultipartFile personalFile){
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root + "\\uploadFiles\\seller";
		
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
			
			personalFile.transferTo(new File(filePath + "\\" + changePerName + perExt));
			
			Attachment perFileDB=new Attachment();
			perFileDB.setFilePath(filePath);
			perFileDB.setOriginName(originPerFileName);
			perFileDB.setChangeName(changePerName);
			
			ss.insertPerFile(perFileDB);
			
			if(!originComFileName.equals("")){
				companyFile.transferTo(new File(filePath + "\\" + changeComName + comExt));
				
				Attachment comFileDB=new Attachment();
				comFileDB.setFilePath(filePath);
				comFileDB.setOriginName(originComFileName);
				comFileDB.setChangeName(changeComName);
				
				ss.insertComFile(comFileDB);
			}
			
			return "seller/sellerMain";
		}
		catch (Exception e) {
			new File(filePath + "\\" + changePerName + perExt).delete();
			if(!originComFileName.equals("")){
				new File(filePath + "\\" + changeComName + comExt).delete();
			}
			
			model.addAttribute("msg", "업체등록 오류");
			
			return "common/errorPage";
		}
		
	}
	
	//상품 관리
	@RequestMapping(value="manageProduct.sell")
	public String manageProduct(Model model, HttpServletRequest request, PageInfo p, String searchParam, String searchWord, String fromDate, String toDate){
		Member m=(Member)request.getSession().getAttribute("loginUser");
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		ArrayList<SearchProduct> list=null;
		PageInfo pi=null;
		int listCount=0;

		if(searchParam == null && searchWord == null){
			listCount=ss.getProductListCount(m.getmId());
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectProductList(m.getmId(), pi);
		}
		else if(searchParam.equals("datePick")){
			listCount=ss.getSearchDateProductListCount(m.getmId(), toDate, fromDate);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchDateProductList(m.getmId(), toDate, fromDate, pi);
		}
		else{
			SearchProduct spd=new SearchProduct();
			
			if(searchParam.equals("comName")){
				spd.setCompanyName(searchWord);
			}
			else if(searchParam.equals("comAddr")){
				spd.setCompanyAddress(searchWord);
			}
			else{
				if(searchWord.equals("승인완료")){
					searchWord="Y";
				}
				else if(searchWord.equals("미승인")){
					searchWord="N";
				}
				spd.setStatus(searchWord);
			}
			
			listCount=ss.getSearchWordProductListCount(m.getmId(), spd);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchWordProductListCount(m.getmId(), spd, pi);
		}
		
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStatus().equals("Y")){
				list.get(i).setStatus("승인완료");
			}
			else if(list.get(i).getStatus().equals("N")){
				list.get(i).setStatus("미승인");
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "seller/manageProduct";
	}
	
	//선택 상품 조회
	@RequestMapping(value="detailCompany.sell")
	public String detailCompany(int cId, Model model){
		ArrayList<OneProduct> opList=ss.selectOneProduct(cId);
		
		model.addAttribute("opList", opList);
		
		return "seller/detailCompany";
	}
	
	//상품 수정 화면 이동
	@RequestMapping(value="editCompanyView.sell")
	public String editCompanyView(OneProduct op, Model model){
		ArrayList<OneProduct> eOP=ss.selectOneProduct(op.getcId());
		
		model.addAttribute("eOP", eOP);
		
		return "seller/editCompany";
	}
	
	//상품 수정
	@RequestMapping(value="editCompany.sell")
	public String editCompany(@RequestParam int cId
			, @RequestParam String roomType1, @RequestParam int roomCount1, @RequestParam String roomPrice1, @RequestParam int roomPeople1
			, @RequestParam(required=false) String roomType2, @RequestParam(required=false) int roomCount2, @RequestParam(required=false) String roomPrice2, @RequestParam(required=false) int roomPeople2
			, @RequestParam(required=false) String roomType3, @RequestParam(required=false) int roomCount3, @RequestParam(required=false) String roomPrice3, @RequestParam(required=false) int roomPeople3
			, Model model){
		
		System.out.println("cId : " + cId);
		System.out.println("roomType : " + roomType1);
		System.out.println("roomType : " + roomType2);
		System.out.println("roomType : " + roomType3);
		System.out.println("roomCount : " + roomCount1);
		System.out.println("roomCount : " + roomCount2);
		System.out.println("roomCount : " + roomCount3);
		System.out.println("roomPrice : " + roomPrice1);
		System.out.println("roomPrice : " + roomPrice2);
		System.out.println("roomPrice : " + roomPrice3);
		System.out.println("roomPeople : " + roomPeople1);
		System.out.println("roomPeople : " + roomPeople2);
		System.out.println("roomPeople : " + roomPeople3);
		
		Room r1=null;
		Room r2=null;
		Room r3=null;
		ArrayList<Room> list=new ArrayList<Room>();
		
		if(roomType2 != null){
			if(roomType3 != null){
				r1=new Room();
				r1.setcId(cId);
				r1.setRoomType(roomType1);
				r1.setRoomCount(roomCount1);
				r1.setRoomPrice(Integer.parseInt(roomPrice1));
				r1.setRoomPeople(roomPeople1);
				
				r2=new Room();
				r2.setcId(cId);
				r2.setRoomType(roomType2);
				r2.setRoomCount(roomCount2);
				r2.setRoomPrice(Integer.parseInt(roomPrice2));
				r2.setRoomPeople(roomPeople2);
				
				r3=new Room();
				r3.setcId(cId);
				r3.setRoomType(roomType3);
				r3.setRoomCount(roomCount3);
				r3.setRoomPrice(Integer.parseInt(roomPrice3));
				r3.setRoomPeople(roomPeople3);
				
				list.add(r1);
				list.add(r2);
				list.add(r3);
			}
			else{
				r1=new Room();
				r1.setcId(cId);
				r1.setRoomType(roomType1);
				r1.setRoomCount(roomCount1);
				r1.setRoomPrice(Integer.parseInt(roomPrice1));
				r1.setRoomPeople(roomPeople1);
				
				r2=new Room();
				r2.setcId(cId);
				r2.setRoomType(roomType2);
				r2.setRoomCount(roomCount2);
				r2.setRoomPrice(Integer.parseInt(roomPrice2));
				r2.setRoomPeople(roomPeople2);
				
				list.add(r1);
				list.add(r2);
			}
		}
		else{
			r1=new Room();
			r1.setcId(cId);
			r1.setRoomType(roomType1);
			r1.setRoomCount(roomCount1);
			r1.setRoomPrice(Integer.parseInt(roomPrice1));
			r1.setRoomPeople(roomPeople1);
			
			list.add(r1);
		}

		int result=ss.updateProduct(list);
		
		if(result > 0){
			ArrayList<OneProduct> opList=ss.selectOneProduct(cId);
			
			model.addAttribute("opList", opList);
			
			return "seller/detailCompany";
		}
		else{
			model.addAttribute("msg", "업체 수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
}
