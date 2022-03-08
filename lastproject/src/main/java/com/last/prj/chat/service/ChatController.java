package com.last.prj.chat.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	@Autowired
	private ChatRoomService chatDAO;
	
	@RequestMapping(value="/EnterChat", method=RequestMethod.GET)
	public String EnterChat(@Param("m_id") String m_id, @Param("p_id") String p_id, Model model, HttpSession session, ChatRoomVO chatroom) throws Exception {
		
		//파라미터 설정
		chatroom.setM_id(m_id);
		chatroom.setP_id(p_id);
		
		//채팅창 존재 여부
		if(chatDAO.isRoom(chatroom) != null) {
			//기존 메시지를 모델에 담아 뷰로 전송
			model.addAttribute("prevMessages",chatDAO.getMessageList(chatroom));
		} else {
			//채팅창 생성
			chatDAO.createRoom(chatroom);
		}
		
		//채팅창 정보 view로 전송
		model.addAttribute("chatroomInfo", chatroom);
		
		return "chat/chatRoomMain";
	}
	
	/*
	 * @PostMapping(value="/newMessage") public String newMessage(MessageVO vo)
	 * throws Exception {
	 * 
	 * chatDAO.insertMessage(vo);
	 * 
	 * return null;
	 * 
	 * }
	 */
	
	
	
}
