package com.last.prj.chat.service;

import lombok.Data;

@Data
public class MessageVO {
	
	private int msg_id;
	private String p_id;
	private String m_id;
	private String message_content;
	private int chat_id;
	private String msg_sender;
	private String msg_receiver;
	private String msg_sendTime;
	
	private int unReadCount;
	
//	public static MessageVO convertMessage(String source) {
//		MessageVO message = new MessageVO();
//		Gson gson = new Gson();
//		message = gson.fromJson(source,  MessageVO.class);
//		return message;
//	}
}
