package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

public interface SellerDao {

	//업체 등록
	int insertCompany(Company c, SqlSessionTemplate sqlSession);

	//객실1 등록
	int insertRoom1(Room rm, SqlSessionTemplate sqlSession);

	//객실2 등록
	int insertRoom2(Room rm, SqlSessionTemplate sqlSession);
	
	//객실3 등록
	int insertRoom3(Room rm, SqlSessionTemplate sqlSession);

	//등록이력 추가
	int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession);

	//사업자등록증 파일 추가
	int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession);

	//법인등록증 파일 추가
	int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession);

	//전체 상품 조회 리스트 카운트
	int getProductListCount(int mId, SqlSessionTemplate sqlSession);

	//전체 상품 조회 리스트
	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession);

	//등록 기간 검색 상품 조회 리스트 카운트
	int getSearchDateProductListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession);

	//등록 기간 검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate,
			PageInfo pi, SqlSessionTemplate sqlSession);

	//검색 상품 조회 리스트 카운트
	int getSearchWordProductListCount(int mId, SearchProduct spd, SqlSessionTemplate sqlSession);

	//검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchWordProductListCount(int mId, SearchProduct spd, PageInfo pi,
			SqlSessionTemplate sqlSession);

	//선택 상품 조회
	ArrayList<OneProduct> selectOneProduct(int cId, SqlSessionTemplate sqlSession);

}
