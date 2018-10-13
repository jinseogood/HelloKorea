package com.kh.hello.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hello.company.model.dao.CompanyDao;
import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Room2;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CompanyDao cd;
	
//	지역 전체 조회.
	@Override
	public ArrayList<Company2> selectAllCompany(Company2 cp) {
		return cd.selectAllCompany(sqlSession, cp);
	}

	@Override
	public ArrayList<Room2> selectRoomList(Room2 roomList) {
		return cd.selectRoomList(sqlSession, roomList);
	}
	
	

}
