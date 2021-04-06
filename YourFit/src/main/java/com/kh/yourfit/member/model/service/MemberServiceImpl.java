package com.kh.yourfit.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.member.model.dao.MemberDAO;
import com.kh.yourfit.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member selectOneMember(String userId) {
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public int idChk(String userInfo) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("M_ID", userInfo);
		return memberDAO.idChk(hmap);
	}

	@Override
	public int nickChk(String userInfo) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("M_NICK", userInfo);
		return memberDAO.nickChk(hmap);
	}
	
	@Override
	public int phoneChk(String userPhone) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("M_PHONE", userPhone);
		return memberDAO.phoneChk(hmap);
	}

	@Override
	public int joinMember(Member member) {
		return memberDAO.joinMember(member);
	}

	@Override
	public Member searchId(String phone_address) {
		return memberDAO.searchId(phone_address);
	}

	@Override
	public Member searchpw(String userInfo) {
		return memberDAO.searchpw(userInfo);
	}

	@Override
	public int updatePassword(Member member) {
		System.out.println(member);
		return memberDAO.updatePassword(member);
	}


}
