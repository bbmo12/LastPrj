package com.last.prj.chat.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ChatRoomService {

	// 채팅 시작
	public void addChatRoom(ChatRoomVO chatroom);

	// sender와 receiver가 같은 채팅창 수 확인
	public int countByChatId(@Param("sender_id") String sender_id, @Param("receiver_id") String receiver_id);

	// sender와 receiver가 같은 채팅창 서치
	public ChatRoomVO findByChatId(@Param("sender_id") String sender_id, @Param("sender_id") String receiver_id);

	// 기존 채팅내역 가져옴.
	public List<ChatRoomVO> readChatHistory(ChatRoomVO chatroom) throws IOException;

	// 채팅방 id
	public int getId(@Param("sender_id")String sender_id, @Param("receiver_id")String receiver_id);

	// 메시지 전송
	public void appendMessage(ChatRoomVO chatroom) throws IOException;

	// 파일 업데이트
	public void updateFileName(@Param("c_no") int c_no, String fileName);

	// sender 읽음처리
	public void updateChatReadS(@Param("c_no") int c_no, int chatReadByS);

	// reciever 읽음처리
	public void updateChatReadR(@Param("c_no") int c_no, int chatReadByR);

	//파일 생성
	void createFile(@Param("c_no") int c_no) throws IOException;
}
