package com.kh.hello.member.model.service;

import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.vo.Member;

public interface MemberService {
	

	
	
	//�Ϲ�ȸ��
	int insertMember(Member m);
	
	//�Ǹ���
	int insertSeller(Member m);

	//�α���
	Member loginMember(Member m) throws LoginException;

	

}
