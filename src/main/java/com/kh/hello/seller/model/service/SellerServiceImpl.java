package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.dao.SellerDao;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
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

	//업체 등록
	@Override
	public int insertCompany(Company c) {
		return sd.insertCompany(c, sqlSession);
	}

	//객실1 등록
	@Override
	public int insertRoom1(Room rm) {
		return sd.insertRoom1(rm, sqlSession);
	}
	
	//객실2 등록
	@Override
	public int insertRoom2(Room rm) {
		return sd.insertRoom2(rm, sqlSession);
	}
	
	//객실3 등록
	@Override
	public int insertRoom3(Room rm) {
		return sd.insertRoom3(rm, sqlSession);
	}

	//등록 이력 추가
	@Override
	public int insertRH(RegistrationHistory rh) {
		return sd.insertRH(rh, sqlSession);
	}

	//사업자등록증 파일 추가
	@Override
	public int insertPerFile(Attachment perFileDB) {
		return sd.insertPerFile(perFileDB, sqlSession);
	}

	//법인등록증 파일 추가
	@Override
	public int insertComFile(Attachment comFileDB) {
		return sd.insertComFile(comFileDB, sqlSession);
	}

	//전체 상품 조회 리스트 카운트
	@Override
	public int getProductListCount(int mId) {
		return sd.getProductListCount(mId, sqlSession);
	}

	//전체 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi) {
		ArrayList<SearchProduct> list=sd.selectProductList(mId, pi, sqlSession);
		
		return list;
	}

	//등록 기간 검색 상품 조회 리스트 카운트
	@Override
	public int getSearchDateProductListCount(int mId, String toDate, String fromDate) {
		return sd.getSearchDateProductListCount(mId, toDate, fromDate, sqlSession);
	}

	//등록 기간 검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi) {
		ArrayList<SearchProduct> list=sd.selectSearchDateProductList(mId, toDate, fromDate, pi, sqlSession);
		
		return list;
	}

	//검색 상품 조회 리스트 카운트
	@Override
	public int getSearchWordProductListCount(int mId, SearchProduct spd) {
		return sd.getSearchWordProductListCount(mId, spd, sqlSession);
	}

	//검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchWordProductListCount(int mId, SearchProduct spd, PageInfo pi) {
		ArrayList<SearchProduct> list=sd.selectSearchWordProductListCount(mId, spd, pi, sqlSession);
		
		return list;
	}

	//선택 상품 조회
	@Override
	public ArrayList<OneProduct> selectOneProduct(int cId) {
		ArrayList<OneProduct> opList=sd.selectOneProduct(cId, sqlSession);
		return opList;
	}

	//업체 수정
	@Override
	public int updateProduct(ArrayList<Room> list) {
		return sd.updateProduct(list, sqlSession);
	}


}
