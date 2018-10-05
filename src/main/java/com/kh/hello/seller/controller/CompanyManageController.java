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
		System.out.println(r);
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
					if(!r.getRoomType4().equals("")){
						if(!r.getRoomType5().equals("")){
							if(!r.getRoomType6().equals("")){
								if(!r.getRoomType7().equals("")){
									if(!r.getRoomType8().equals("")){
										if(!r.getRoomType9().equals("")){
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
											
											Room rm4=new Room();
											rm4.setrId(r.getcId());
											rm4.setRoomType(r.getRoomType4());
											rm4.setRoomCount(r.getRoomCount4());
											rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
											rm4.setRoomPeople(r.getRoomPeople4());
											rm4.setrId(r.getrId());
											
											ss.insertRoom4(rm4);
											
											Room rm5=new Room();
											rm5.setrId(r.getcId());
											rm5.setRoomType(r.getRoomType5());
											rm5.setRoomCount(r.getRoomCount5());
											rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
											rm5.setRoomPeople(r.getRoomPeople5());
											rm5.setrId(r.getrId());
											
											ss.insertRoom5(rm5);
											
											Room rm6=new Room();
											rm6.setrId(r.getcId());
											rm6.setRoomType(r.getRoomType6());
											rm6.setRoomCount(r.getRoomCount6());
											rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
											rm6.setRoomPeople(r.getRoomPeople6());
											rm6.setrId(r.getrId());
											
											ss.insertRoom6(rm6);
											
											Room rm7=new Room();
											rm7.setrId(r.getcId());
											rm7.setRoomType(r.getRoomType7());
											rm7.setRoomCount(r.getRoomCount7());
											rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
											rm7.setRoomPeople(r.getRoomPeople7());
											rm7.setrId(r.getrId());
											
											ss.insertRoom7(rm7);
											
											Room rm8=new Room();
											rm8.setrId(r.getcId());
											rm8.setRoomType(r.getRoomType8());
											rm8.setRoomCount(r.getRoomCount8());
											rm8.setRoomPrice(Integer.parseInt(r.getRoomPrice8()));
											rm8.setRoomPeople(r.getRoomPeople8());
											rm8.setrId(r.getrId());
											
											ss.insertRoom8(rm8);
											
											Room rm9=new Room();
											rm9.setrId(r.getcId());
											rm9.setRoomType(r.getRoomType9());
											rm9.setRoomCount(r.getRoomCount9());
											rm9.setRoomPrice(Integer.parseInt(r.getRoomPrice9()));
											rm9.setRoomPeople(r.getRoomPeople9());
											rm9.setrId(r.getrId());
											
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
											
											Room rm3=new Room();
											rm3.setrId(r.getcId());
											rm3.setRoomType(r.getRoomType3());
											rm3.setRoomCount(r.getRoomCount3());
											rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
											rm3.setRoomPeople(r.getRoomPeople3());
											rm3.setrId(r.getrId());
											
											ss.insertRoom3(rm3);
											
											Room rm4=new Room();
											rm4.setrId(r.getcId());
											rm4.setRoomType(r.getRoomType4());
											rm4.setRoomCount(r.getRoomCount4());
											rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
											rm4.setRoomPeople(r.getRoomPeople4());
											rm4.setrId(r.getrId());
											
											ss.insertRoom4(rm4);
											
											Room rm5=new Room();
											rm5.setrId(r.getcId());
											rm5.setRoomType(r.getRoomType5());
											rm5.setRoomCount(r.getRoomCount5());
											rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
											rm5.setRoomPeople(r.getRoomPeople5());
											rm5.setrId(r.getrId());
											
											ss.insertRoom5(rm5);
											
											Room rm6=new Room();
											rm6.setrId(r.getcId());
											rm6.setRoomType(r.getRoomType6());
											rm6.setRoomCount(r.getRoomCount6());
											rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
											rm6.setRoomPeople(r.getRoomPeople6());
											rm6.setrId(r.getrId());
											
											ss.insertRoom6(rm6);
											
											Room rm7=new Room();
											rm7.setrId(r.getcId());
											rm7.setRoomType(r.getRoomType7());
											rm7.setRoomCount(r.getRoomCount7());
											rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
											rm7.setRoomPeople(r.getRoomPeople7());
											rm7.setrId(r.getrId());
											
											ss.insertRoom7(rm7);
											
											Room rm8=new Room();
											rm8.setrId(r.getcId());
											rm8.setRoomType(r.getRoomType8());
											rm8.setRoomCount(r.getRoomCount8());
											rm8.setRoomPrice(Integer.parseInt(r.getRoomPrice8()));
											rm8.setRoomPeople(r.getRoomPeople8());
											rm8.setrId(r.getrId());
											
											ss.insertRoom8(rm8);
											
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
										
										Room rm4=new Room();
										rm4.setrId(r.getcId());
										rm4.setRoomType(r.getRoomType4());
										rm4.setRoomCount(r.getRoomCount4());
										rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
										rm4.setRoomPeople(r.getRoomPeople4());
										rm4.setrId(r.getrId());
										
										ss.insertRoom4(rm4);
										
										Room rm5=new Room();
										rm5.setrId(r.getcId());
										rm5.setRoomType(r.getRoomType5());
										rm5.setRoomCount(r.getRoomCount5());
										rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
										rm5.setRoomPeople(r.getRoomPeople5());
										rm5.setrId(r.getrId());
										
										ss.insertRoom5(rm5);
										
										Room rm6=new Room();
										rm6.setrId(r.getcId());
										rm6.setRoomType(r.getRoomType6());
										rm6.setRoomCount(r.getRoomCount6());
										rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
										rm6.setRoomPeople(r.getRoomPeople6());
										rm6.setrId(r.getrId());
										
										ss.insertRoom6(rm6);
										
										Room rm7=new Room();
										rm7.setrId(r.getcId());
										rm7.setRoomType(r.getRoomType7());
										rm7.setRoomCount(r.getRoomCount7());
										rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
										rm7.setRoomPeople(r.getRoomPeople7());
										rm7.setrId(r.getrId());
										
										ss.insertRoom7(rm7);
										
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
									
									Room rm4=new Room();
									rm4.setrId(r.getcId());
									rm4.setRoomType(r.getRoomType4());
									rm4.setRoomCount(r.getRoomCount4());
									rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
									rm4.setRoomPeople(r.getRoomPeople4());
									rm4.setrId(r.getrId());
									
									ss.insertRoom4(rm4);
									
									Room rm5=new Room();
									rm5.setrId(r.getcId());
									rm5.setRoomType(r.getRoomType5());
									rm5.setRoomCount(r.getRoomCount5());
									rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
									rm5.setRoomPeople(r.getRoomPeople5());
									rm5.setrId(r.getrId());
									
									ss.insertRoom5(rm5);
									
									Room rm6=new Room();
									rm6.setrId(r.getcId());
									rm6.setRoomType(r.getRoomType6());
									rm6.setRoomCount(r.getRoomCount6());
									rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
									rm6.setRoomPeople(r.getRoomPeople6());
									rm6.setrId(r.getrId());
									
									ss.insertRoom6(rm6);
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
								
								Room rm4=new Room();
								rm4.setrId(r.getcId());
								rm4.setRoomType(r.getRoomType4());
								rm4.setRoomCount(r.getRoomCount4());
								rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
								rm4.setRoomPeople(r.getRoomPeople4());
								rm4.setrId(r.getrId());
								
								ss.insertRoom4(rm4);
								
								Room rm5=new Room();
								rm5.setrId(r.getcId());
								rm5.setRoomType(r.getRoomType5());
								rm5.setRoomCount(r.getRoomCount5());
								rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
								rm5.setRoomPeople(r.getRoomPeople5());
								rm5.setrId(r.getrId());
								
								ss.insertRoom5(rm5);
								
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
							
							Room rm4=new Room();
							rm4.setrId(r.getcId());
							rm4.setRoomType(r.getRoomType4());
							rm4.setRoomCount(r.getRoomCount4());
							rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
							rm4.setRoomPeople(r.getRoomPeople4());
							rm4.setrId(r.getrId());
							
							ss.insertRoom4(rm4);
							
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
			perFileDB.setChangeName(changePerName + perExt);
			
			ss.insertPerFile(perFileDB);
			
			if(!originComFileName.equals("")){
				companyFile.transferTo(new File(filePath + "\\" + changeComName + comExt));
				
				Attachment comFileDB=new Attachment();
				comFileDB.setFilePath(filePath);
				comFileDB.setOriginName(originComFileName);
				comFileDB.setChangeName(changeComName + comExt);
				
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
		
		System.out.println("eOP list size : " + eOP.size());
		
		model.addAttribute("eOP", eOP);
		
		return "seller/editCompany";
	}
	
	//상품 수정
	@RequestMapping(value="editCompany.sell")
	public String editCompany(@RequestParam int cId
			, @RequestParam String roomType1, @RequestParam int roomCount1, @RequestParam String roomPrice1
			, @RequestParam(name="roomType2", required=false) String roomType2, @RequestParam(name="roomCount2", required=false) int roomCount2, @RequestParam(name="roomPrice2", required=false) String roomPrice2
			, @RequestParam(name="roomType3", required=false) String roomType3, @RequestParam(name="roomCount3", required=false) int roomCount3, @RequestParam(name="roomPrice3", required=false) String roomPrice3
			, @RequestParam(name="roomType4", required=false) String roomType4, @RequestParam(name="roomCount4", required=false) int roomCount4, @RequestParam(name="roomPrice4", required=false) String roomPrice4
			, @RequestParam(name="roomType5", required=false) String roomType5, @RequestParam(name="roomCount5", required=false) int roomCount5, @RequestParam(name="roomPrice5", required=false) String roomPrice5
			, @RequestParam(name="roomType6", required=false) String roomType6, @RequestParam(name="roomCount6", required=false) int roomCount6, @RequestParam(name="roomPrice6", required=false) String roomPrice6
			, @RequestParam(name="roomType7", required=false) String roomType7, @RequestParam(name="roomCount7", required=false) int roomCount7, @RequestParam(name="roomPrice7", required=false) String roomPrice7
			, @RequestParam(name="roomType8", required=false) String roomType8, @RequestParam(name="roomCount8", required=false) int roomCount8, @RequestParam(name="roomPrice8", required=false) String roomPrice8
			, @RequestParam(name="roomType9", required=false) String roomType9, @RequestParam(name="roomCount9", required=false) int roomCount9, @RequestParam(name="roomPrice9", required=false) String roomPrice9
			, Model model){
		
		System.out.println("rCount1 : " + roomCount1);
		System.out.println("rCount2 : " + roomCount2);
		
		Room r1=null;
		Room r2=null;
		Room r3=null;
		Room r4=null;
		Room r5=null;
		Room r6=null;
		Room r7=null;
		Room r8=null;
		Room r9=null;
		ArrayList<Room> list=new ArrayList<Room>();
		
		if(roomType2 != null){
			if(roomType3 != null){
				if(roomType4 != null){
					if(roomType5 != null){
						if(roomType6 != null){
							if(roomType7 != null){
								if(roomType8 != null){
									if(roomType9 != null){
										r1=new Room();
										r1.setcId(cId);
										r1.setRoomType(roomType1);
										r1.setRoomCount(roomCount1);
										r1.setRoomPrice(Integer.parseInt(roomPrice1));
										
										r2=new Room();
										r2.setcId(cId);
										r2.setRoomType(roomType2);
										r2.setRoomCount(roomCount2);
										r2.setRoomPrice(Integer.parseInt(roomPrice2));
										
										r3=new Room();
										r3.setcId(cId);
										r3.setRoomType(roomType3);
										r3.setRoomCount(roomCount3);
										r3.setRoomPrice(Integer.parseInt(roomPrice3));
										
										r4=new Room();
										r4.setcId(cId);
										r4.setRoomType(roomType4);
										r4.setRoomCount(roomCount4);
										r4.setRoomPrice(Integer.parseInt(roomPrice4));
										
										r5=new Room();
										r5.setcId(cId);
										r5.setRoomType(roomType5);
										r5.setRoomCount(roomCount5);
										r5.setRoomPrice(Integer.parseInt(roomPrice5));
										
										r6=new Room();
										r6.setcId(cId);
										r6.setRoomType(roomType6);
										r6.setRoomCount(roomCount6);
										r6.setRoomPrice(Integer.parseInt(roomPrice6));
										
										r7=new Room();
										r7.setcId(cId);
										r7.setRoomType(roomType7);
										r7.setRoomCount(roomCount7);
										r7.setRoomPrice(Integer.parseInt(roomPrice7));
										
										r8=new Room();
										r8.setcId(cId);
										r8.setRoomType(roomType8);
										r8.setRoomCount(roomCount8);
										r8.setRoomPrice(Integer.parseInt(roomPrice8));
										
										r9=new Room();
										r9.setcId(cId);
										r9.setRoomType(roomType9);
										r9.setRoomCount(roomCount9);
										r9.setRoomPrice(Integer.parseInt(roomPrice9));
										
										list.add(r1);
										list.add(r2);
										list.add(r3);
										list.add(r4);
										list.add(r5);
										list.add(r6);
										list.add(r7);
										list.add(r8);
										list.add(r9);
									}
									else{
										r1=new Room();
										r1.setcId(cId);
										r1.setRoomType(roomType1);
										r1.setRoomCount(roomCount1);
										r1.setRoomPrice(Integer.parseInt(roomPrice1));
										
										r2=new Room();
										r2.setcId(cId);
										r2.setRoomType(roomType2);
										r2.setRoomCount(roomCount2);
										r2.setRoomPrice(Integer.parseInt(roomPrice2));
										
										r3=new Room();
										r3.setcId(cId);
										r3.setRoomType(roomType3);
										r3.setRoomCount(roomCount3);
										r3.setRoomPrice(Integer.parseInt(roomPrice3));
										
										r4=new Room();
										r4.setcId(cId);
										r4.setRoomType(roomType4);
										r4.setRoomCount(roomCount4);
										r4.setRoomPrice(Integer.parseInt(roomPrice4));
										
										r5=new Room();
										r5.setcId(cId);
										r5.setRoomType(roomType5);
										r5.setRoomCount(roomCount5);
										r5.setRoomPrice(Integer.parseInt(roomPrice5));
										
										r6=new Room();
										r6.setcId(cId);
										r6.setRoomType(roomType6);
										r6.setRoomCount(roomCount6);
										r6.setRoomPrice(Integer.parseInt(roomPrice6));
										
										r7=new Room();
										r7.setcId(cId);
										r7.setRoomType(roomType7);
										r7.setRoomCount(roomCount7);
										r7.setRoomPrice(Integer.parseInt(roomPrice7));
										
										r8=new Room();
										r8.setcId(cId);
										r8.setRoomType(roomType8);
										r8.setRoomCount(roomCount8);
										r8.setRoomPrice(Integer.parseInt(roomPrice8));
										
										list.add(r1);
										list.add(r2);
										list.add(r3);
										list.add(r4);
										list.add(r5);
										list.add(r6);
										list.add(r7);
										list.add(r8);
									}
								}
								else{
									r1=new Room();
									r1.setcId(cId);
									r1.setRoomType(roomType1);
									r1.setRoomCount(roomCount1);
									r1.setRoomPrice(Integer.parseInt(roomPrice1));
									
									r2=new Room();
									r2.setcId(cId);
									r2.setRoomType(roomType2);
									r2.setRoomCount(roomCount2);
									r2.setRoomPrice(Integer.parseInt(roomPrice2));
									
									r3=new Room();
									r3.setcId(cId);
									r3.setRoomType(roomType3);
									r3.setRoomCount(roomCount3);
									r3.setRoomPrice(Integer.parseInt(roomPrice3));
									
									r4=new Room();
									r4.setcId(cId);
									r4.setRoomType(roomType4);
									r4.setRoomCount(roomCount4);
									r4.setRoomPrice(Integer.parseInt(roomPrice4));
									
									r5=new Room();
									r5.setcId(cId);
									r5.setRoomType(roomType5);
									r5.setRoomCount(roomCount5);
									r5.setRoomPrice(Integer.parseInt(roomPrice5));
									
									r6=new Room();
									r6.setcId(cId);
									r6.setRoomType(roomType6);
									r6.setRoomCount(roomCount6);
									r6.setRoomPrice(Integer.parseInt(roomPrice6));
									
									r7=new Room();
									r7.setcId(cId);
									r7.setRoomType(roomType7);
									r7.setRoomCount(roomCount7);
									r7.setRoomPrice(Integer.parseInt(roomPrice7));
									
									list.add(r1);
									list.add(r2);
									list.add(r3);
									list.add(r4);
									list.add(r5);
									list.add(r6);
									list.add(r7);
								}
							}
							else{
								r1=new Room();
								r1.setcId(cId);
								r1.setRoomType(roomType1);
								r1.setRoomCount(roomCount1);
								r1.setRoomPrice(Integer.parseInt(roomPrice1));
								
								r2=new Room();
								r2.setcId(cId);
								r2.setRoomType(roomType2);
								r2.setRoomCount(roomCount2);
								r2.setRoomPrice(Integer.parseInt(roomPrice2));
								
								r3=new Room();
								r3.setcId(cId);
								r3.setRoomType(roomType3);
								r3.setRoomCount(roomCount3);
								r3.setRoomPrice(Integer.parseInt(roomPrice3));
								
								r4=new Room();
								r4.setcId(cId);
								r4.setRoomType(roomType4);
								r4.setRoomCount(roomCount4);
								r4.setRoomPrice(Integer.parseInt(roomPrice4));
								
								r5=new Room();
								r5.setcId(cId);
								r5.setRoomType(roomType5);
								r5.setRoomCount(roomCount5);
								r5.setRoomPrice(Integer.parseInt(roomPrice5));
								
								r6=new Room();
								r6.setcId(cId);
								r6.setRoomType(roomType6);
								r6.setRoomCount(roomCount6);
								r6.setRoomPrice(Integer.parseInt(roomPrice6));
								
								list.add(r1);
								list.add(r2);
								list.add(r3);
								list.add(r4);
								list.add(r5);
								list.add(r6);
							}
						}
						else{
							r1=new Room();
							r1.setcId(cId);
							r1.setRoomType(roomType1);
							r1.setRoomCount(roomCount1);
							r1.setRoomPrice(Integer.parseInt(roomPrice1));
							
							r2=new Room();
							r2.setcId(cId);
							r2.setRoomType(roomType2);
							r2.setRoomCount(roomCount2);
							r2.setRoomPrice(Integer.parseInt(roomPrice2));
							
							r3=new Room();
							r3.setcId(cId);
							r3.setRoomType(roomType3);
							r3.setRoomCount(roomCount3);
							r3.setRoomPrice(Integer.parseInt(roomPrice3));
							
							r4=new Room();
							r4.setcId(cId);
							r4.setRoomType(roomType4);
							r4.setRoomCount(roomCount4);
							r4.setRoomPrice(Integer.parseInt(roomPrice4));
							
							r5=new Room();
							r5.setcId(cId);
							r5.setRoomType(roomType5);
							r5.setRoomCount(roomCount5);
							r5.setRoomPrice(Integer.parseInt(roomPrice5));
							
							list.add(r1);
							list.add(r2);
							list.add(r3);
							list.add(r4);
							list.add(r5);
						}
					}
					else{
						r1=new Room();
						r1.setcId(cId);
						r1.setRoomType(roomType1);
						r1.setRoomCount(roomCount1);
						r1.setRoomPrice(Integer.parseInt(roomPrice1));
						
						r2=new Room();
						r2.setcId(cId);
						r2.setRoomType(roomType2);
						r2.setRoomCount(roomCount2);
						r2.setRoomPrice(Integer.parseInt(roomPrice2));
						
						r3=new Room();
						r3.setcId(cId);
						r3.setRoomType(roomType3);
						r3.setRoomCount(roomCount3);
						r3.setRoomPrice(Integer.parseInt(roomPrice3));
						
						r4=new Room();
						r4.setcId(cId);
						r4.setRoomType(roomType4);
						r4.setRoomCount(roomCount4);
						r4.setRoomPrice(Integer.parseInt(roomPrice4));
						
						list.add(r1);
						list.add(r2);
						list.add(r3);
						list.add(r4);
					}
				}
				else{
					r1=new Room();
					r1.setcId(cId);
					r1.setRoomType(roomType1);
					r1.setRoomCount(roomCount1);
					r1.setRoomPrice(Integer.parseInt(roomPrice1));
					
					r2=new Room();
					r2.setcId(cId);
					r2.setRoomType(roomType2);
					r2.setRoomCount(roomCount2);
					r2.setRoomPrice(Integer.parseInt(roomPrice2));
					
					r3=new Room();
					r3.setcId(cId);
					r3.setRoomType(roomType3);
					r3.setRoomCount(roomCount3);
					r3.setRoomPrice(Integer.parseInt(roomPrice3));
					
					list.add(r1);
					list.add(r2);
					list.add(r3);
				}
			}
			else{
				r1=new Room();
				r1.setcId(cId);
				r1.setRoomType(roomType1);
				r1.setRoomCount(roomCount1);
				r1.setRoomPrice(Integer.parseInt(roomPrice1));
				
				r2=new Room();
				r2.setcId(cId);
				r2.setRoomType(roomType2);
				r2.setRoomCount(roomCount2);
				r2.setRoomPrice(Integer.parseInt(roomPrice2));
				
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
			
			list.add(r1);
		}

		System.out.println("controller list : " + list);
		
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
	
	//등록 기간 연장
	@RequestMapping(value="extendsPeriod.sell")
	public String extendsPeriod(@RequestParam String cId, @RequestParam String term, Model model, HttpServletRequest request){
		
		int result=ss.extendsPeriod(cId, term);
		
		if(result > 0){
			Member m=(Member)request.getSession().getAttribute("loginUser");
			
			ArrayList<SearchProduct> list=null;
			PageInfo pi=null;
			int listCount=0;
			
			listCount=ss.getProductListCount(m.getmId());
			pi=Pagination.getPageInfo(1, listCount);
			list=ss.selectProductList(m.getmId(), pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "seller/manageProduct";
		}
		else{
			model.addAttribute("msg", "기간 연장 실패");
			
			return "common/errorPage";
		}
	}
	
}
