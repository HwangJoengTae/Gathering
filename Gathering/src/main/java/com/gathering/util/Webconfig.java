package com.gathering.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class Webconfig implements WebSocketConfigurer{

    private final WebHandler  webSocketHandler;
    

    public Webconfig(WebHandler webSocketHandler) {
        this.webSocketHandler = webSocketHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        
    	registry.addHandler(webSocketHandler, "/chat").setAllowedOrigins("*");
    }
}
