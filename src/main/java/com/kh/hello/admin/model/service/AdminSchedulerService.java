package com.kh.hello.admin.model.service;
      
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import com.kh.hello.admin.model.dao.AdminSchedulerDao;
import com.kh.hello.admin.model.vo.Blacklist;

@Service
public class AdminSchedulerService {

	//블랙리스트 해제 모듈
	public int terminateBlacklist() {
		int result = 0;
		AdminSchedulerDao asd = new AdminSchedulerDao();
		SqlSession session = getSqlSession();
		//블랙리스트 해지 대상자 검색
		ArrayList<Blacklist> b = asd.selectTerminateList(session);
		System.out.println(b);
		//블랙리스트 이력에 해지이력 넣기
		int result1 = asd.insertTerminateHistroy(session, b);
		System.out.println(result1);
		//멤버 상태 업데이트
		int result2 = asd.updateMemberStatus2(session, b);
		System.out.println(result2);
		if(result1 > 0 && result2 > 0){
			result = 1;
		}
		System.out.println("service");
		return result;
	}

	public static SqlSession getSqlSession(){
		SqlSession session = null;
		
		try {
			InputStream stream = Resources.getResourceAsStream("D:\\git\\HelloKorea\\src\\main\\resources\\mybatis-config2.xml");
			
//			openSession(false) : autocommit에 대한 설정.
			session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			System.out.println(session);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return session;
	}
}
