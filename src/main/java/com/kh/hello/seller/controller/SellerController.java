package com.kh.hello.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {
	@RequestMapping("myPageView.sell")
	public String myPageView(){
		return "seller/sellerMain";
	}
	
	@RequestMapping("addCompany.sell")
	public String addCompanyView(){
		return "seller/addCompany";
	}
	
	@RequestMapping("manageProduct.sell")
	public String manageProductView(){
		return "seller/manageProduct";
	}
	
	@RequestMapping("reservation.sell")
	public String reservationView(){
		return "seller/reservation";
	}
	
	@RequestMapping("manageRevenue.sell")
	public String manageRevenueView(){
		return "seller/manageRevenue";
	}
	
	@RequestMapping("editCompany.sell")
	public String editCompanyView(){
		return "seller/editCompany";
	}

}
