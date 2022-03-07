package com.last.prj.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	/*websocket을 구성하기 위한 config 파일임.*/
	
	@Autowired
	private EchoHandler echoHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(echoHandler, "/echo")	.setAllowedOrigins("*")
		.withSockJS()
		.setClientLibraryUrl("https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js")	//sockJS 사용 가능하도록
		.setInterceptors(new HttpSessionHandshakeInterceptor());
	}
}
