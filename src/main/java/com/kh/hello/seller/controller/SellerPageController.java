package com.kh.hello.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerPageController {
	@RequestMapping("myPageView.sell")
	public String myPageView(){
		return "seller/sellerMain";
	}
	
	@RequestMapping("addCompanyView.sell")
	public String addCompanyView(){
		return "seller/addCompany";
	}
	
	@RequestMapping("manageRevenueView.sell")
	public String manageRevenueView(){
		return "seller/manageRevenue";
	}
	
}
