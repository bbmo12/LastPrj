package com.last.prj.chat.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/EnterChat")
	public String EnterChat(@Param("m_id") String m_id, @Param("p_id") String p_id, Model model) {
		
		
		return "chat/chatRoomMain";
	}
}
