package com.kh.hello.seller.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.seller.model.dao.SellerDao;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;

@Service
public class SellerServiceImpl implements SellerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SellerDao sd;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int insertCompany(Company c) {
		System.out.println("service company : " + c);
		
		return sd.insertCompany(c, sqlSession);
	}

	@Override
	public int insertRoom(Room rm) {
		System.out.println("service room : " + rm);
		
		return sd.insertRoom(rm, sqlSession);
	}

	@Override
	public int insertRH(RegistrationHistory rh) {
		System.out.println("service RH : " + rh);
		
		return sd.insertRH(rh, sqlSession);
	}

}
