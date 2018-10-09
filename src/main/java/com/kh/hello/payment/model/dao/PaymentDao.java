package com.kh.hello.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

public interface PaymentDao {

	//결제 정보 등록
	int insertPayment(Payment p, SqlSessionTemplate sqlSession);

	//결제 상세 정보 등록
	int insertPayDetail(ArrayList<PayDetail> pdList, SqlSessionTemplate sqlSession);

}
