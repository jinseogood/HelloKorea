package com.kh.hello.payment.model.service;

import java.util.ArrayList;

import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

public interface PaymentService {

	//결제 정보 등록
	int insertAllPayment(Payment p, ArrayList<PayDetail> pdList);

}
