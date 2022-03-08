package com.last.prj.chat.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.chat.service.ChatRoomService;
import com.last.prj.chat.service.ChatRoomVO;
import com.last.prj.chat.service.TimeUtils;

@Controller
public class ChatRoomController {
	/*
	 * @Autowired private SimpMessagingTemplate simpMessage;
	 * 
	 * @Autowired private ChatRoomService chatDAO;
	 */
	
	//채팅방 이동
	/*
	 * @RequestMapping(value="/chatMessage", method=RequestMethod.GET) public String
	 * getWebSocketWithSockJs(@RequestParam("m_id") String
	 * m_id, @RequestParam("p_id") String p_id, Model model, HttpSession session,
	 * ChatRoomVO chatroom) throws IOException{
	 * 
	 * //파라미터 설정 String sender_id = m_id; chatroom.setSender_id(sender_id);
	 * 
	 * String receiver_id = p_id; chatroom.setReceiver_id(p_id);
	 * 
	 * //채팅창 존재 여부 확인 if(chatDAO.countByChatId(sender_id, receiver_id) > 0) { //채팅창
	 * 정보 가져옴. ChatRoomVO chatRoomTemp = chatDAO.findByChatId(sender_id,
	 * receiver_id); //기존 채팅 기록 불러옴 List<ChatRoomVO> chatHistory =
	 * chatDAO.readChatHistory(chatRoomTemp); //모델에 담아 뷰로 이동.
	 * model.addAttribute("chatHistory", chatHistory); } else { //채팅창 생성
	 * chatDAO.addChatRoom(chatroom); //text file 생성
	 * chatDAO.createFile(chatroom.getC_no()-1); }
	 * 
	 * //채팅방 add 시 생성될 chatId
	 * chatroom.setC_no(chatDAO.getId(chatroom.getSender_id(),
	 * chatroom.getReceiver_id()));
	 * 
	 * //모델에 담아 뷰로 이동 model.addAttribute("chatRoomInfo", chatroom);
	 * 
	 * return "chat/chatRoomMain"; }
	 */
	
	/*
	 * @MessageMapping("/broadcast") public void send(ChatRoomVO chatroom) throws
	 * Exception{
	 * 
	 * chatroom.setSendTime(TimeUtils.getCurrentTimeStamp());
	 * chatDAO.appendMessage(chatroom);
	 * 
	 * int c_no = chatroom.getC_no();
	 * 
	 * String url = "/user" + c_no + "/queue/messages";
	 * simpMessage.convertAndSend(url, new ChatRoomVO(chatroom.getContent(),
	 * chatroom.getUser(), chatroom.getSendTime())); }
	 */
	
	/*
	 * @RequestMappgin(value = "/chatting", method = RequestMethod.GET) public
	 * ModelAndView chat()
	 */
	
	
}
