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

import com.google.gson.Gson;
import com.last.prj.mem.service.MemVO;

public class ChatWebSocketHandler extends TextWebSocketHandler{
	

	@Inject
	private ChatRoomService chatDAO;

	private List<WebSocketSession> connectedUsers;
	

	public ChatWebSocketHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		connectedUsers.add(session);
	}

	@Override

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());

	}


	@Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		System.out.println(message.getPayload());

		  Map<String, Object> map = null;

	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());

	      System.out.println("1 : " + messageVO.toString());


	      ChatRoomVO roomVO  = new ChatRoomVO();
	      roomVO.setP_id(messageVO.getP_id()); //튜터
	      roomVO.setM_id(messageVO.getM_id()); //유저

	      ChatRoomVO croom =null;
	      if(!messageVO.getM_id().equals(messageVO.getM_id())) {
	    	  System.out.println("a");



	    	  if(chatDAO.isRoom(roomVO) == null ) {
	    		  System.out.println("b");
	    		  chatDAO.createRoom(roomVO);
	    		  System.out.println("d");
	    		  croom = chatDAO.isRoom(roomVO);

	    	  }else {
	    		  System.out.println("C");
	    		  croom = chatDAO.isRoom(roomVO);
	    	  }
	      }else {

    		  croom = chatDAO.isRoom(roomVO);
    	  }

	      messageVO.setChat_id(croom.getChat_id());
	      if(croom.getM_id().equals(messageVO.getMsg_sender())) {

	    	  messageVO.setMsg_receiver(roomVO.getP_id());;
	      }else {
	    	  messageVO.setMsg_receiver(roomVO.getM_id());
	      }


	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         MemVO login = (MemVO) map.get("login");

	         //받는사람
	         if (login.getM_id().equals(messageVO.getMsg_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }
	      }
	   }

	@Override

	public void handleTransportError(

			WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(logmsg);
	}
}
