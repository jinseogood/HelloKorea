package com.kh.hello.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Blacklist;

@Repository
public class AdminSchedulerDao {

	//블랙리스트 해지 - 해당자 검색
	public ArrayList<Blacklist> selectTerminateList(SqlSession session) {
		return (ArrayList)session.selectList("selectTerminateList");
	}

	//블랙리스트 해지 - 이력 업데이트
	public int insertTerminateHistroy(SqlSession session, ArrayList<Blacklist> b) {
		int result = 0;
		for(Blacklist list : b){
			result = session.insert("insertTerminateHistroy", list);
			if(result <= 0){
				return result;
			}
		}
		return result;
	}

	//블랙리스트 해지 - 멤버 상태 업데이트
	public int updateMemberStatus2(SqlSession session, ArrayList<Blacklist> b) {
		int result = 0;
		for(Blacklist list : b){
			result = session.update("updateMemberStatus2", list);
			if(result <= 0){
				return result;
			}
		}
		return result;
	}
}
