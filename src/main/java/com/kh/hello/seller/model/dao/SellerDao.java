package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.seller.model.vo.Attachment;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.PageInfo;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

public interface SellerDao {

	int insertCompany(Company c, SqlSessionTemplate sqlSession);

	int insertRoom1(Room rm, SqlSessionTemplate sqlSession);

	int insertRoom2(Room rm, SqlSessionTemplate sqlSession);
	
	int insertRoom3(Room rm, SqlSessionTemplate sqlSession);

	int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession);

	int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession);

	int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession);

	int getProductListCount(int mId, SqlSessionTemplate sqlSession);

	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession);

}
