package com.example;





import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gathering.mapper.NoticeMapper;
import com.gathering.service.NoticeService;

@SpringBootTest
class BoardWeb011ApplicationTests {
	private static final Logger log = LoggerFactory.getLogger(NoticeService.class);
		@Autowired
		NoticeMapper mapper;
		
		@Autowired
		NoticeService noticeService;
		 /*게시판 조회*/
	    @Test
	    public void testGETPage() {
	        
	        int bno = 8;
	        
	        log.info("" + noticeService.getNotice(bno));
	        
	    }
}
