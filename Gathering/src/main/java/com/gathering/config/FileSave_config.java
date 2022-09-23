package com.gathering.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileSave_config implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// upload 파일 저장 위치
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///c:/gatheringFileSave/");
	}
	
}