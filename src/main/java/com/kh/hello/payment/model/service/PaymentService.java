package com.kh.hello.payment.model.service;

import java.util.ArrayList;

import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

public interface PaymentService {

	//결제 정보 등록
	int insertAllPayment(Payment p, ArrayList<PayDetail> pdList);

	//결제 완료 페이지에 보여 줄 결제 정보 조회
	Payment selectPayInfo(int mId);
	
	//결제 완료 페이지에 보여 줄 결제 상세 정보 조회
	ArrayList<PayDetail> selectPayDetailInfo(int paId);

}
