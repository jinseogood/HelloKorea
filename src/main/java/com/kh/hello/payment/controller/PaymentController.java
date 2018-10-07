package com.kh.hello.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	@RequestMapping("paymentDetailView.pay")
	public String paymentDetailView(){
		return "payment/detailPayment";
	}
	
	@RequestMapping(value="paymentConfirm.pay")
	public String paymentConfirm(){
		System.out.println("결제완료");
		return "payment/confirmPayment";
	}

}
