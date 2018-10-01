package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.seller.model.dao.SellerDao;
import com.kh.hello.seller.model.vo.Attachment;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.PageInfo;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

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
		return sd.insertCompany(c, sqlSession);
	}

	@Override
	public int insertRoom1(Room rm) {
		return sd.insertRoom1(rm, sqlSession);
	}
	
	@Override
	public int insertRoom2(Room rm) {
		return sd.insertRoom2(rm, sqlSession);
	}
	
	@Override
	public int insertRoom3(Room rm) {
		return sd.insertRoom3(rm, sqlSession);
	}

	@Override
	public int insertRH(RegistrationHistory rh) {
		return sd.insertRH(rh, sqlSession);
	}

	@Override
	public int insertPerFile(Attachment perFileDB) {
		return sd.insertPerFile(perFileDB, sqlSession);
	}

	@Override
	public int insertComFile(Attachment comFileDB) {
		return sd.insertComFile(comFileDB, sqlSession);
	}

	@Override
	public int getProductListCount(int mId) {
		return sd.getProductListCount(mId, sqlSession);
	}

	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi) {
		ArrayList<SearchProduct> list=sd.selectProductList(mId, pi, sqlSession);
		
		return list;
	}


}
