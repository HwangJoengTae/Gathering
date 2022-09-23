package com.gathering.service;

import java.util.List;

import com.gathering.dto.FilesVO;
import com.gathering.dto.NoticeVO;
import com.gathering.util.Criteria;

public interface NoticeService {
	
	
		//공지사항 목록
		public List<NoticeVO> getNoticeList(NoticeVO searchVO);
		
		//공지사항 페이지 적용
		public List<NoticeVO> getListPaging(Criteria cri);
		
		//공지사항 등록
		public void InsertNotice(NoticeVO noticeVO);
		
		// 공지사항 상세보기
		public NoticeVO getNotice(int notice_seq);
		
		//공지사항 수정하기 
		public int updateNotice(NoticeVO searchVO);
		
		//공지사항 삭제하기
		public void deleteNotice(int notice_seq);
		
		//공지사항 총 갯수 
		public int getTotal(Criteria cri);
		
		// 조회수 증가
		public void noticeViewCount(int notice_seq);
		
		//이미지 정보 얻기 
		public List<FilesVO>getAttachInfo(int notice_seq);
		
		
		
}

   

    

   

