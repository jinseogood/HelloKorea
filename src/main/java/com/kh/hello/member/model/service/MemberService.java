package com.kh.hello.member.model.service;

import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.vo.Member;

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

	

}
