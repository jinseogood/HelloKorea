package com.kh.hello.company.model.service;

import java.util.ArrayList;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyService {

	ArrayList<Company2> selectAllCompany(Company2 cp);

	ArrayList<Room2> selectRoomList(Room2 roomList);

	Reservation2 insertReservation(Reservation2 reservation);

	ArrayList<Company2> selectOrderByName(Company2 cp);





}
