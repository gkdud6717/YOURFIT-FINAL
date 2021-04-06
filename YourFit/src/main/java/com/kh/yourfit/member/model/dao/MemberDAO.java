package com.kh.yourfit.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import com.kh.yourfit.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String userId);

	Member searchId(String phone_address);

	Member searchpw(String userInfo);

	int idChk(HashMap<String, Object> hmap);

	int nickChk(HashMap<String, Object> hmap);

	int phoneChk(HashMap<String, Object> hmap);
	
	int joinMember(Member member);

	int updatePassword(Member member);



	
}