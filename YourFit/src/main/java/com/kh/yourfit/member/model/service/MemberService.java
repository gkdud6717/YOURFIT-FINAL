package com.kh.yourfit.member.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kh.yourfit.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String userId);

	Member searchId(String phone_address);

	Member searchpw(String userInfo);
	
	int idChk(String userId);

	int nickChk(String userNick);

	int phoneChk(String userPhone);

	int joinMember(Member member);

	int updatePassword(Member member);



}
