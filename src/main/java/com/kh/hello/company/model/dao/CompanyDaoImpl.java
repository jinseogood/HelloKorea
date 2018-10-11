package com.kh.hello.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.company.model.vo.Company2;

@Repository
public class CompanyDaoImpl implements CompanyDao {


	@Override
	public ArrayList<Company2> selectAllCompany(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectList", cp);
	}
	
	

}
