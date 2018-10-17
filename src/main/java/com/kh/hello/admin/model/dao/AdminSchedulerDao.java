package com.kh.hello.admin.model.dao;
     
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Blacklist;

@Repository
public class AdminSchedulerDao {

	//블랙리스트 해지 
		//블랙리스트 이력내에서 업데이트
		public int updateTerminateHistroy(SqlSessionTemplate sqlSession) {
			return sqlSession.update("Blacklist.updateTerminateHistroy");
		}

		public int updateMemberStatus2(SqlSessionTemplate sqlSession) {
			return sqlSession.update("Blacklist.updateMemberStatus2");
		}
}
