package com.last.prj.chat.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.last.prj.chat.service.ChatRoomService;
import com.last.prj.chat.service.ChatRoomVO;
import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.PmemService;
import com.last.prj.pmember.service.PmemberService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatRoomService chatDAO;
	
	@Autowired
	private MemService memDao;
	
	@Autowired
	private PmemberService pMemberDao;
	
	//채팅방 입장
	@RequestMapping(value="/EnterChat", method=RequestMethod.GET)
	public String EnterChat(@Param("m_id") String m_id, @Param("p_id") String p_id, Model model, HttpSession session, ChatRoomVO chatroom) throws Exception {
		
		//파라미터 설정
		chatroom.setM_id(m_id);
		chatroom.setP_id(p_id);
		
		//채팅창 존재 여부
		if(chatDAO.isRoom(chatroom) != null) {
			//채팅방이 있다면 기존에 주고받은 메시지를 모델에 담아 뷰로 전송
			model.addAttribute("prevMessages",chatDAO.getMessageList(chatroom));
		} else {
			//채팅방이 없다면 신규 생성
			chatDAO.createRoom(chatroom);
		}
		
		//참가자 정보 + 채팅창 정보 model에 담아 view로 전송
		model.addAttribute("memInfo", memDao.memberOne(m_id));
		model.addAttribute("pmemInfo", pMemberDao.PmemberOne(p_id));
		model.addAttribute("chatroomInfo", chatroom);
		
		return "chat/chatRoomMain";
	}
	
	//일반 회원 채팅 내역 조회 + 채팅별 최근 메시지 + 최근 메시지를 쓴 멤버 정보
	@RequestMapping(value="/memRoomList", method=RequestMethod.GET)
	public String memRoomList(@Param("m_id") String m_id, Model model) throws Exception{
		
		model.addAttribute("memRoom", chatDAO.getRoomList(m_id));
		/* model.addAttribute("recentMsg", chatDAO.get) */
		
		return "mypage/memChatList";
	}
	
	//파트너 회원 채팅 내역 조회 + 채팅별 최근 메시지 + 최근 메시지를 쓴 멤버 정보
	@RequestMapping(value="pmemRoomList", method=RequestMethod.GET)
	public String pmemRoomList(@Param("p_id") String p_id, Model model) throws Exception{
		
		model.addAttribute("pmemRoom", chatDAO.getRoomList2(p_id));
		
		return "mypage/pmemChatList";
	}
	
}
