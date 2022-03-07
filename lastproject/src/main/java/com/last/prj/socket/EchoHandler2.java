package com.last.prj.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler2 extends TextWebSocketHandler{

	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//websocket 연결 성공 시 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		String user_name = searchUserName(session);
		
		sessionList.add(session);
	}
	
	//websocket 메시지 송수신
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		String user_name = searchUserName(session);
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_name  + " : " + message.getPayload()));
		}
	}
	
	//websocket 연결 종료
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		String user_name = searchUserName(session);
		System.out.println("연결 종료");
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_name + "님의 연결이 끊어졌습니다."));
		}
		sessionList.remove(session);
	}
	
	//세션 이름 가져옴.
	private String searchUserName(WebSocketSession session) throws Exception{
		// TODO Auto-generated method stub
		
		String user_name;
		Map<String, Object> map;
		map = session.getAttributes();
		user_name = (String) map.get("name");
		
		return user_name;
	}
}
