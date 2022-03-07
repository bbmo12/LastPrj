package com.last.prj.chat.service;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatListVO {
	private int c_no;	//PK
	private String receiver_id;	//받는 사람
	private String sender_id;	//보낸 사람
	private String fileName;
	private Timestamp createdDate;
	private int chatReadByS;
	private int chatReadByR;
	
	//not in DB
	private String content;
	private String sendTime;
	private String user;
}
