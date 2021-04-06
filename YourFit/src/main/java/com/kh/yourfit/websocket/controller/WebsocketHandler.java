package com.kh.yourfit.websocket.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.yourfit.member.model.vo.Member;

public class WebsocketHandler extends TextWebSocketHandler {
	
	// 웹소켓 연결 사용자 목록
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override // 웹소켓 연결 시작 시 동작!@
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		
		System.out.println(session.getId() + " :: 연결됨");
		
		// session으로부터 로그인한 사용자 정보 가져오기
		Member loginMember = (Member)session.getAttributes().get("member");
		
		// 채팅방 입장 시 상대방에게 입장 메시지 보내기 
		for(WebSocketSession user : sessionList) {
			if(user != session) {
				user.sendMessage(new TextMessage(loginMember.getM_Nick() + "님이 입장하셨습니다."));
			}
			
		}
	}

	

	@Override // 웹소켓으로 메시지 전송 시 동작!@
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Member loginMember = (Member)session.getAttributes().get("member");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
				for(WebSocketSession user : sessionList) {
					
					user.sendMessage(new TextMessage(session.getId() 
									+ "|" + message.getPayload()
									+ "|" + session.getRemoteAddress() + "|" + loginMember.getM_Nick()
									+ "|" + sdf.format(new Date())));
				}
	}



	@Override // 웹소켓 종료 시 동작!
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		
		System.out.println(session.getId() + ":: 연결 종료!");
		
		Member loginMember = (Member)session.getAttributes().get("member");
		
		for(WebSocketSession user : sessionList) {
			user.sendMessage(new TextMessage(loginMember.getM_Nick() +"님이 퇴장하셨습니다."));
		}
	}
	
	
	
}
