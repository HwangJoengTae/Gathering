package com.gathering.main;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;

import com.gathering.dto.GroupInfoVO;
import com.gathering.service.GroupService;
import com.gathering.service.SudaService;

@SpringBootTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class BestListTest {
	
	
	@Autowired
	private GroupService groupService;
	@Autowired
	private SudaService sudaService;
	
	
	
	@Test
	@DisplayName("베스트 테스트")
	void BestTest() {
				
		GroupInfoVO vo = new GroupInfoVO();
		
		
		
		
	}
	

}
