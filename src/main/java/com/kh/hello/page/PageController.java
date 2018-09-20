package com.kh.hello.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("mainView")
	public String mainView(){
		return "main/main";
	}
	
	@RequestMapping("aboutView")
	public String aboutView(){
		return "aboutArea/aboutAllArea";
	}
	
	@RequestMapping("toursView")
	public String toursView(){
		return "main/tours";
	}
	
	@RequestMapping("contactView")
	public String contactView(){
		return "main/contact";
	}
	
	@RequestMapping("myPageView")
	public String myPageView(){
		return "seller/addCompany";
	}
	
	@RequestMapping("companySearch")
	public String companySearchView(){
		return "seller/companySearch";
	}
	
	@RequestMapping("addCompany")
	public String addCompanyView(){
		return "seller/addCompany";
	}
	
	@RequestMapping("manageProduct")
	public String manageProductView(){
		return "seller/manageProduct";
	}
	
	@RequestMapping("reservation")
	public String reservationView(){
		return "seller/reservation";
	}
	
	@RequestMapping("manageRevenue")
	public String manageRevenueView(){
		return "seller/manageRevenue";
	}
	
	@RequestMapping("editCompany")
	public String editCompanyView(){
		return "seller/editCompany";
	}
	
	@RequestMapping("detailReservation")
	public String detailReservationView(){
		return "seller/detailReservation";
	}
	
	@RequestMapping("aboutAreaHotel")
	public String aboutAreaHotel(){
		return "aboutArea/searchAreaHotel";
	}
	
	@RequestMapping("aboutAreaFood")
	public String aboutAreaFood(){
		return "aboutArea/searchAreaFood";
	}
	
	@RequestMapping("aboutAreaGame")
	public String aboutAreaGame(){
		return "aboutArea/searchAreaGame";
	}
	
	@RequestMapping("deatilHotel")
	public String detailHotelView(){
		return "aboutDetail/detailHotel";
	}
}
