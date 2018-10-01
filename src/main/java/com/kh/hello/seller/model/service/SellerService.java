package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import com.kh.hello.seller.model.vo.Attachment;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.PageInfo;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

public interface SellerService {

	int insertCompany(Company c);

	int insertRoom1(Room rm);
	
	int insertRoom2(Room rm);
	
	int insertRoom3(Room rm);

	int insertRH(RegistrationHistory rh);

	int insertPerFile(Attachment perFileDB);

	int insertComFile(Attachment comFileDB);

	int getProductListCount(int mId);

	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi);

}
