package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.vo.Company;
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

	int getSearchDateProductListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession);

	ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate,
			PageInfo pi, SqlSessionTemplate sqlSession);

	int getSearchWordProductListCount(int mId, SearchProduct spd, SqlSessionTemplate sqlSession);

	ArrayList<SearchProduct> selectSearchWordProductListCount(int mId, SearchProduct spd, PageInfo pi,
			SqlSessionTemplate sqlSession);

}
