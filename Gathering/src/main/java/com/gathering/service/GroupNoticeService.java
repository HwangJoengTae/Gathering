package com.gathering.service;


import java.util.HashMap;
import java.util.List;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.paging.Criteria;

public interface GroupNoticeService {

		public void insertGroupNotice(GroupNoticeVO vo);
	
		//groupNotice 리스트 (페이징+검색)
		public List<GroupNoticeVO> getListPaging(Criteria cri);
		
		//groupNotice 리스트 총갯수
		public int getTotal(HashMap<String, Object> map);
		
		//그룹내 공지 상세
		public GroupNoticeVO groupNoticeView(int group_notice_seq);
		
		//조회수 증가
		public  void groupNoticeViewCount(int group_notice_seq);
		
		//공지 수정
		public void updateGroupNotice(GroupNoticeVO vo);
		
		//공지 삭제
		public void deleteGroupNotice(int group_notice_seq);
		
		public List<CrewInfoVIewVO> getCrewList(int group_seq, String user_id);

}