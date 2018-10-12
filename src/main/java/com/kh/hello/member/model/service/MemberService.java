package com.kh.hello.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;

public interface MemberService {

	
	//
	int insertMember(Member m);
	
	//
	int insertSeller(Member m);

	//
	Member loginMember(Member m) throws LoginException;

	int updateAddUser(Member m);
	
	//회원시퀀스 
	int selectMemberSequence();

	int selectSellerSequence();
	
	
	int updateAddSeller(Member m);


	int uploadprofile(Attachment a);


	
	//페이스북 로그인
	int insertFacebook(Member m);

	//facebook check
	Member selectSnsChceck(HashMap<String, Object> snsInfo);
	
	//마이페이지
	//프로필 수정
	int editProfile(Member m);
	
	//찜목록
	ArrayList<MemberGoods> selectGoodsList(int mId);
	
	//프로필사진
	Attachment selectMemberProfile(int mId);
	
	//프로필사진이 있을경우
	Attachment selectMemberProfile1(int mId);

	
	
}
