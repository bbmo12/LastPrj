package com.last.prj.chat.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.last.prj.chat.service.ChatRoomMapper;
import com.last.prj.chat.service.ChatRoomService;
import com.last.prj.chat.service.ChatRoomVO;

@Repository("chatDAO")
@Transactional
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomMapper map;

	/*@Value("${file.upload.path.txt}")
	String fileUploadPath;*/
	
	@Override
	public void addChatRoom(ChatRoomVO chatroom) {

		Timestamp createdDate = Timestamp.valueOf(LocalDateTime.now());

		chatroom.setCreatedDate(createdDate);

		map.addChatRoom(chatroom);
	}

	@Override
	public int countByChatId(String sender_id, String receiver_id) {

		return map.countByChatId(sender_id, receiver_id);
	}

	@Override
	public ChatRoomVO findByChatId(String sender_id, String receiver_id) {

		return map.findByChatId(sender_id, receiver_id);
	}

	@Override
	public List<ChatRoomVO> readChatHistory(ChatRoomVO chatroom) throws IOException {

		String pathName = "D:/chat/" + chatroom.getFileName();

		// DB에 저장된 chat.txt 파일을 읽어옴.
		BufferedReader br = new BufferedReader(new FileReader(pathName));

		// chatroom에 담아 view로 전달
		ChatRoomVO chatRoomLines = new ChatRoomVO();
		List<ChatRoomVO> chatHistory = new ArrayList<ChatRoomVO>();

		String chatLine;
		int idx = 1;

		while ((chatLine = br.readLine()) != null) {

			int answer = idx % 3;
			if (answer == 1) {
				// 보낸사람.
				chatRoomLines.setUser(chatLine);
				idx++;
			} else if (answer == 2) {
				// 메시지 내용
				chatRoomLines.setContent(chatLine);
				idx++;
			} else {
				// 보낸 시간
				chatRoomLines.setSendTime(chatLine);
				// List에 저장
				chatHistory.add(chatRoomLines);
				// 객체 초기화, row 인덱스 초기화
				chatRoomLines = new ChatRoomVO();
				idx = 1;
			}
		}
		return chatHistory;
	}

	@Override
	public void createFile(int c_no) throws IOException {

		String fileName = c_no + ".txt";
		String pathName = "D:/chat/" + fileName;

		// File 클래스에 pathName 할당
		File txtfile = new File(pathName);

		// 로컬 경로에 파일 생성
		txtfile.createNewFile();

	}

	@Override
	public int getId(String sender_id, String receiver_id) {

		return map.getId(sender_id, receiver_id);
	}

	@Override
	public void appendMessage(ChatRoomVO chatroom) throws IOException {

		String receiverId = chatroom.getReceiver_id();
		String senderId = chatroom.getSender_id();

		ChatRoomVO chatRoomAppend = map.findByChatId(senderId, receiverId);

		String pathName = "D:/chat/" + chatRoomAppend.getFileName();

		FileOutputStream fos = new FileOutputStream(pathName, true);
		String content = chatroom.getContent();
		String user = chatroom.getUser();
		String sendTime = chatroom.getSendTime();

		String writeContent = user + "\n" + content + "\n" + "[" + sendTime + "]" + "\n";

		byte[] b = writeContent.getBytes();

		fos.write(b);
		fos.close();

		if (user.equals(chatroom.getSender_id())) {
			updateChatReadR(chatroom.getC_no(), 0);
		} else {
			updateChatReadS(chatroom.getC_no(), 0);
		}
	}


	@Override
	public void updateFileName(int c_no, String fileName) {

		map.updateFileName(c_no, fileName);

	}

	@Override
	public void updateChatReadS(int c_no, int chatReadByS) {
		map.updateChatReadS(c_no, chatReadByS);

	}

	@Override
	public void updateChatReadR(int c_no, int chatReadByR) {
		map.updateChatReadR(c_no, chatReadByR);

	}

}
