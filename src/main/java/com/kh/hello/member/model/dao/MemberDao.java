package com.kh.hello.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.vo.BoardAndReply;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;

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




	int insertFacebook(Member m, SqlSessionTemplate sqlSession);

	//sns체크
	Member selectSnsChceck(HashMap<String, Object> snsInfo, SqlSessionTemplate sqlSession);
	
	//마이페이지
	int editProfile(Member m, SqlSessionTemplate sqlSession);
	
	int uploadprofile(Attachment a, SqlSessionTemplate sqlSession);
	//찜목록
	ArrayList<MemberGoods> selectGoodsList(int mId, SqlSessionTemplate sqlSession);
	
	
	Attachment selectMemberProfile(int mId,SqlSessionTemplate sqlSession);
	
	//사진이 있을경우
	Attachment selectMemberProfile1(int mId, SqlSessionTemplate sqlSession);
	
	//닉네임체크'
	int nicknameCheck(String nickname, SqlSessionTemplate sqlSession);
	
	//활동내역
	ArrayList<BoardAndReply> selectboreList(int mId, SqlSessionTemplate sqlSession);


	
}
