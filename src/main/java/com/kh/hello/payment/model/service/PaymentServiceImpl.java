package com.kh.hello.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hello.payment.model.dao.PaymentDao;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PaymentDao pd;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	//결제 정보 등록
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, rollbackFor={Exception.class})
	public int insertAllPayment(Payment p, ArrayList<PayDetail> pdList) {
		int result=-99;
		
		int resultP=pd.insertPayment(p, sqlSession);
		int resultPD=pd.insertPayDetail(pdList, sqlSession);
		
		if(resultP > 0 && resultPD > 0){
			result=1;
		}
		else{
			result=0;
		}
		
		return result;
	}
	
	//결제 완료 페이지에 보여 줄 결제 정보 조회
	@Override
	public Payment selectPayInfo(int mId) {
		return pd.selectPayInfo(mId, sqlSession);
	}

	//결제 완료 페이지에 보여 줄 결제 상세 정보 조회
	@Override
	public ArrayList<PayDetail> selectPayDetailInfo(int paId) {
		return pd.selectPayDetailInfo(paId, sqlSession);
	}

	//예약 정보에 결제 번호 추가
	@Override
	public int updateReservation(int oId) {
		return pd.updateReservation(oId, sqlSession);
	}

}
