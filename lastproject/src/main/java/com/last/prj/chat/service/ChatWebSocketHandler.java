package com.last.prj.chat.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.last.prj.mem.service.MemVO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Inject
	private ChatRoomService chatDAO;

	private List<WebSocketSession> connectedUsers;

	public ChatWebSocketHandler() {
		//채팅방에 연결된 유저들의 세션을 arrayList 형태로 담는다.
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	//웹소켓 연결 시 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session);
		
		
		System.out.println(senderId + "채팅 연결");

		users.put(senderId, session);
		connectedUsers.add(session);
	}

	//웹소켓 종료 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberId(session);
		
		log(senderId + " 채팅 종료");
		connectedUsers.remove(session);
		users.remove(senderId);

	}

	//메시지 전송 시 메소드.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//getPayLoad 호출 시 전송된 메시지 확인 가능.
		String msg = message.getPayload();
		
		System.out.println("msg:" + msg);
		
		//JSON으로 전송된 메시지를 java 객체로 파싱해준다.
		ObjectMapper objectMapper = new ObjectMapper();
		MessageVO messagevo= objectMapper.readValue(msg, MessageVO.class);
		
		//message 테이블에 삽입.
		chatDAO.insertMessage(messagevo);
		
		//연결된 클라이언트에게 메시지 전송.
		for (String key : users.keySet()) {
			WebSocketSession wss = users.get(key);
			try {
				wss.sendMessage(new TextMessage(msg));
				/* System.out.println("메시지 들어감."); */
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//예외처리
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		
		String senderId = getMemberId(session);
		log(senderId + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(logmsg);
	}

	// 웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String id = (String) httpSession.get("mId"); // 세션에 저장된 mId 기준 조회
		return id == null ? null : id;
	}
}
