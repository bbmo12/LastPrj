package com.last.prj.chat.service;

import java.util.List;

public interface ChatRoomService {

	public void createRoom(ChatRoomVO vo) throws Exception;

	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception;

	public void insertMessage(MessageVO vo) throws Exception;

	/*
	 * public String getPartner(ChatRoomVO vo) throws Exception;
	 * 
	 * public String getProfile(String str) throws Exception;
	 * 
	 * public String getName(String str) throws Exception;
	 */

	public List<MessageVO> getMessageList(ChatRoomVO chatroom) throws Exception;

	public List<ChatRoomVO> getRoomList(String str) throws Exception;

	public List<ChatRoomVO> getRoomList2(String str) throws Exception;

	public MessageVO getRecentMessage(String str) throws Exception;
	// public String isGetMessageList(String str)throws Exception;

	/* public String getTutorId(String str) throws Exception; */

	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception;

	/*
	 * public void updateReadTime(int class_id, String user_id, String
	 * TUTOR_USER_user_id) throws Exception;
	 * 
	 * public void updateReadTimeTutor(int class_id, String user_id, String
	 * TUTOR_USER_user_id) throws Exception;
	 */

	/*
	 * public int getUnReadCountTutor(String p_id, String m_id) throws Exception;
	 * 
	 * public int getAllCount(String str);
	 * 
	 * public int getUnReadCount(String p_id, String m_id) throws Exception;
	 */
}
