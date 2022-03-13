package com.last.prj.socket;

import java.security.Principal;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.last.prj.mem.service.LoginVO;
import com.last.prj.security.CustomUser;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
		Map<String, Object> attributes) throws Exception {
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		HttpServletRequest req = ssreq.getServletRequest();
		
		//LoginVO loginvo = (LoginVO) req.getSession().getAttribute("loginInfo");
		//attributes.put("loginvo", loginvo);
		//System.out.println("loginvo : "+loginvo);
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal != null) {
		
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
			if(userDetails.getRole() == "일반회원") {
				String mid = userDetails.getMember().getM_id();
				attributes.put("id", mid);
				
			}else if(userDetails.getRole() == "파트너회원") {
				String pid = userDetails.getPmember().getP_id();
				attributes.put("id", pid);
			}
		}
		/*
		String mid = (String) req.getSession().getAttribute("mId");
		attributes.put("mId", mid);
		// 이거쓰려면 null 체크하기
		*/
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After Handshake");
		super.afterHandshake(request, response, wsHandler, ex);
	}
}