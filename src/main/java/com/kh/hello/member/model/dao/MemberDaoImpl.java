package com.kh.hello.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.member.model.vo.Member;
@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("m : " +m);
		
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public int insertSeller(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Member.insertSeller",m);
	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getEmail());
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectLoginUser",m);
	}
	@Override
	public int updateAddUser(Member m, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("Member.updateAddUser",m);
	}
	
	//회원시퀀스
	@Override
	public int selectMemberSequence(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectMemberSequence");
	}

	

	

}
