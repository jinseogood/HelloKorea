package com.kh.hello.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyDao {

	ArrayList<Company2> selectAllCompany(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Room2> selectRoomList(SqlSessionTemplate sqlSession, Room2 roomList);

}
