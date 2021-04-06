package com.kh.yourfit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yourfit.common.exception.MemberException;
import com.kh.yourfit.member.model.service.MemberService;
import com.kh.yourfit.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("/member/page_move.do")
	public ModelAndView page_move(HttpServletRequest req) {

		ModelAndView mv = new ModelAndView();

		String page_info = req.getQueryString();
		String page_name = "";

		if (page_info.equals("id_Find")) {
			page_name = "아이디 찾기";
			mv.setViewName("member/searchForm");
		} else if (page_info.equals("pw_Find")) {
			page_name = "비밀번호 찾기";
			mv.setViewName("member/searchForm");
		} else if (page_info.equals("login")) {
			mv.setViewName("member/login");
		} else{
			mv.setViewName("member/join");
		}
		
		mv.addObject("page_info", page_info);
		mv.addObject("page_name", page_name);
		
		return mv;
	}
	
	@RequestMapping("/member/login_action.do")
	public ModelAndView login_action(@RequestParam String userId, @RequestParam String userPwd) {

		ModelAndView mv = new ModelAndView();
		String loc="";
		String msg = "";

		Member m = memberService.selectOneMember(userId);

		if (m == null) {
			msg = "존재하지 않는 아이디 입니다.";
		} else {
			if (bcryptPasswordEncoder.matches(userPwd, m.getM_Pwd())) {
				if (m.getM_Suspension().equals("N")) {
					loc = "/";
					msg = m.getM_Name() + "님 환영합니다.";
					mv.addObject("member", m);
				} else {
					loc="/member/page_move.do?login";
					msg = "정지된 아이디 입니다. 관리자에게 문의하세요.";
				}
			} else {
				loc="/member/page_move.do?login";
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);

		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/member/search_action.do")
	public ModelAndView search_Info(Member member, SessionStatus sessionStatus,
									@RequestParam String userInfo,	@RequestParam String phone_address,
									@RequestParam String userEmail,	HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView();
		String search_info = req.getQueryString();
		String msg = "";
		String page_name = "";
		String user_id = "";

		if (search_info.equals("id_Find")) {
			page_name="아이디 찾기";
			Member m = memberService.searchId(phone_address);
			if (m==null) {
				msg = "입력하신 정보로 가입된 정보가 없습니다.";
			} else if(m.getM_Email().equals(userEmail) && m.getM_Name().equals(userInfo)){
				user_id = m.getM_Id();
				msg = "가입하신 아이디는 " + m.getM_Id() + " 입니다.";
			} else {
				msg = "잘못된 정보를 입력하셨습니다.";
			}
			
		} else {
			page_name="비밀번호 찾기";
			Member m = memberService.searchpw(userInfo);
			if (m==null) {
				msg = "입력하신 아이디는 존재 하지 않습니다.";
			} else if(m.getM_Email().equals(userEmail) && m.getM_Phone().equals(phone_address)){
				
				// 랜덤 키 생성
				Random random = new Random();
				String key = "";

				for (int i = 0; i < 3; i++) {
					int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
					key += (char) index;
				}
				int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
				key += numIndex;
				
				// 메일 보내기
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(m.getM_Email());
				message.setSubject("임시 비밀번호 발급");
				message.setText("임시 비밀번호 : " + key +"\n 임시비밀번호로 로그인 시 꼭 비밀번호 변경을 해주세요!");
				mailSender.send(message);
				
				// 임시 비밀번호 암호화
				String encryptPassword = bcryptPasswordEncoder.encode(key);
				
				// 암호화된 비밀번호 업데이트
				member.setM_Id(m.getM_Id());
				member.setM_Pwd(encryptPassword);
				int result = memberService.updatePassword(member);
				
				if (result > 0) {
					user_id = m.getM_Id();
					msg = "임시 비밀번호가 발급 되었습니다. 메일을 확인하세요.";
				} else {
					msg = "오류가 발생했습니다. 관리자에게 문의 하세요.";
				}
			} else {
				msg = "잘못된 정보를 입력하셨습니다.";
			}
		}
		
		if (!sessionStatus.isComplete()) {sessionStatus.setComplete();}
		
		mv.addObject("user_id",user_id);
		mv.addObject("page_name",page_name);
		mv.addObject("msg",msg);
		mv.setViewName("member/searchForm");
		
		return mv;
	}
	
	@RequestMapping("/member/Logout.do")
	public String memberLogout(SessionStatus sessionStatus) {

		if (!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}

		return "redirect:/";
	}

	@RequestMapping("/member/memberJoin.do")
	public String memberJoin(Member member, Model model, SessionStatus sessionStatus) {

		String plainPassword = member.getM_Pwd();
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);

		member.setM_Pwd(encryptPassword);

		try {

			int result = memberService.joinMember(member);

			String loc = "/";
			String msg = "";

			if (result > 0) {
				msg = "회원 가입 성공";
			} else {
				msg = "회원 가입 실패";
			}

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);

		} catch (Exception e) {

			System.out.println("회원 가입 에러 발생!!");

			throw new MemberException(e.getMessage());

		}
		if (!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}

		return "common/msg";

	}

	@RequestMapping("/member/idChk.do")
	@ResponseBody
	public Map<String, Object> idChk(@RequestParam String userId) {

		Map<String, Object> map = new HashMap<String, Object>();

		boolean isUsable = memberService.idChk(userId) == 0 ? true : false;

		map.put("isUsable", isUsable);

		return map;
	}

	@RequestMapping("/member/nickChk.do")
	@ResponseBody
	public Map<String, Object> nickChk(@RequestParam String userNick) {

		Map<String, Object> map = new HashMap<String, Object>();

		boolean isUsable = memberService.nickChk(userNick) == 0 ? true : false;

		map.put("isUsable", isUsable);

		return map;
	}
	
	@RequestMapping("/member/phoneChk.do")
	@ResponseBody
	public Map<String, Object> phoneChk(@RequestParam String userPhone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.phoneChk(userPhone) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}

	@RequestMapping("/member/CheckMail.do")
	@ResponseBody
	public Map<String, Object> SendMail(String mail, HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		mailSender.send(message);
		map.put("key", key);
		return map;
	}
}