package com.gathering.notice;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.gathering.dto.NoticeVO;
import com.gathering.service.NoticeService;


@SpringBootTest
class NoticeTest {
	
		
	@Autowired
	private NoticeService noticeService;
	
	/*공지글 상세 정보*/
	@Test
	public void getNoticeTest() {
		
		int notice_seq = 4;
				
		NoticeVO noticeInfo = noticeService.getNotice(notice_seq);
		
		System.out.println("전체 정보 입니다 : "+ noticeInfo);
		System.out.println("notice_seq 정보 입니다 : "+ noticeInfo.getNotice_seq());
		System.out.println("이미지 정보 입니다 : "+ noticeInfo.getImageList());
		
	}

}
