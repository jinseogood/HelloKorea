package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

public interface SellerService {

	//업체 등록
	int insertCompany(Company c);

	//객실1 등록
	int insertRoom1(Room rm);
	
	//객실2 등록
	int insertRoom2(Room rm);
	
	//객실3 등록
	int insertRoom3(Room rm);

	//등록이력 추가
	int insertRH(RegistrationHistory rh);

	//사업자등록증 파일 추가
	int insertPerFile(Attachment perFileDB);

	//법인등록증 파일 추가
	int insertComFile(Attachment comFileDB);

	//전체 상품 조회 리스트 카운트
	int getProductListCount(int mId);

	//전체 상품 조회 리스트
	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi);

	//등록 기간 검색 상품 조회 리스트 카운트
	int getSearchDateProductListCount(int mId, String toDate, String fromDate);

	//등록 기간 검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi);

	//검색 상품 조회 리스트 카운트
	int getSearchWordProductListCount(int mId, SearchProduct spd);

	//검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchWordProductListCount(int mId, SearchProduct spd, PageInfo pi);

	//선택 상품 조회
	ArrayList<OneProduct> selectOneProduct(int cId);

	//업체 수정
	int updateProduct(ArrayList<Room> list);

}
