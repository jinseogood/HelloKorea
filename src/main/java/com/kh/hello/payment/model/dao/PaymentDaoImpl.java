package com.kh.hello.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	//결제 정보 등록
	@Override
	public int insertPayment(Payment p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Payment.insertPayment", p);
	}

	//결제 상세 정보 등록
	@Override
	public int insertPayDetail(ArrayList<PayDetail> pdList, SqlSessionTemplate sqlSession) {
		int result=0;
		for(int i=0;i<pdList.size();i++){
			PayDetail pd=pdList.get(i);
			System.out.println("dao PayDetail : " + pd);
			result=sqlSession.insert("PayDetail.insertPayDetail", pd);
		}
		return result;
	}

}
