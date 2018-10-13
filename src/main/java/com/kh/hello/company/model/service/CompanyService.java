package com.kh.hello.company.model.service;

import java.util.ArrayList;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyService {

	ArrayList<Company2> selectAllCompany(Company2 cp);

	ArrayList<Room2> selectRoomList(Room2 roomList);

}
