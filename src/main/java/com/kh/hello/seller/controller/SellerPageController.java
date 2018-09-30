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
	
	@RequestMapping("manageProductView.sell")
	public String manageProductView(){
		return "seller/manageProduct";
	}
	
	@RequestMapping("reservationView.sell")
	public String reservationView(){
		return "seller/reservation";
	}
	
	@RequestMapping("manageRevenueView.sell")
	public String manageRevenueView(){
		return "seller/manageRevenue";
	}
	
	@RequestMapping("editCompanyView.sell")
	public String editCompanyView(){
		return "seller/editCompany";
	}
	
	@RequestMapping("paymentDetailView.sell")
	public String paymentDetailView(){
		return "payment/detailPayment";
	}

}
