package com.kh.hello.seller.model.service;

import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;

public interface SellerService {

	int insertCompany(Company c);

	int insertRoom(Room rm);

	int insertRH(RegistrationHistory rh);

}
