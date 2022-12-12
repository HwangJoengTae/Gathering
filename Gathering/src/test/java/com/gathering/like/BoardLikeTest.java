package com.gathering.like;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;

import com.gathering.dto.LikeVO;
import com.gathering.mapper.SudaMapper;
import com.gathering.service.SudaService;

@SpringBootTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class BoardLikeTest {
	
	
	@Autowired
	private SudaService sudaService;
	@Autowired
	private SudaMapper sudaMapper;
	
	/*
	@Test
	@DisplayName("좋아요 아이디 조회 테스트")
	void liketest() {
				
		LikeVO like = new LikeVO();
		like.setSuda_seq(11);
		like.setUser_id("aaaa");
			
				 
		System.out.println("번호는 :   "+ like.getSuda_seq());
		System.out.println("아이디는 :   "+ like.getUser_id());
		
		
		sudaService.findLike(like);
		
		System.out.println("결과는 : "+ sudaService.findLike(like));
		
		
	}
	*/
	
	/*
	@Test
	@DisplayName("좋아요 업 테스트")
	void likeUptest() {
				
		LikeVO like = new LikeVO();
		like.setSuda_seq(11);
		like.setUser_id("테스트아이디");
			
			
		sudaService.likeUp(like);
		
		System.out.println("결과는 : "+ sudaService.likeUp(like));
		
		
	}
	*/
	
	/*
	@Test
	@DisplayName("좋아요 다운 테스트")
	void likeDowntest() {
				
		LikeVO like = new LikeVO();
		like.setSuda_seq(11);
		like.setUser_id("aaaa");
			
			
		sudaService.likeDown(like);
		
		System.out.println("결과는 : "+ sudaService.likeDown(like));
		
		
	}
	*/
	
	@Test
	@DisplayName("좋아요 갯수 찾기 테스트")
	void likeCounttest() {
				
		LikeVO like = new LikeVO();
		
	
		like.setSuda_seq(11);
		like.setUser_id("aaaa");
					
			
		sudaService.getLike(like);
		
		System.out.println("결과는 : "+ like);
		
		
	}
	

}
