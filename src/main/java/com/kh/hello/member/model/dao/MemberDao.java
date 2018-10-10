package com.kh.hello.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	int insertSeller(SqlSessionTemplate sqlSession, Member m);
	
	
	//
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int updateAddUser(Member m, SqlSessionTemplate sqlSession);
	
	
	//회원시퀀스
	int selectMemberSequence(SqlSessionTemplate sqlSession);

	int selectSellerSequence(SqlSessionTemplate sqlSession);

	int updateAddSeller(Member m, SqlSessionTemplate sqlSession);

	int editProfile(Member m, SqlSessionTemplate sqlSession);

	int uploadprofile(Attachment a, SqlSessionTemplate sqlSession);

	int photoCheck(int mId, SqlSessionTemplate sqlSession);


	int insertFacebook(Member m, SqlSessionTemplate sqlSession);


	Member selectSnsChceck(HashMap<String, Object> snsInfo, SqlSessionTemplate sqlSession);


	
}
