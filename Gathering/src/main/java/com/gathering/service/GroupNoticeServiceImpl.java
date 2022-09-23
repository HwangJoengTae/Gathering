package com.gathering.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.mapper.GroupNoticeMapper;
import com.gathering.paging.Criteria;

@Service
public class GroupNoticeServiceImpl implements GroupNoticeService {

	@Autowired
	 private GroupNoticeMapper groupNoticeMapper;
	
	@Override
	public void insertGroupNotice(GroupNoticeVO vo) {
		
		groupNoticeMapper.insertGroupNotice(vo);
	}
	
	
	//groupNotice 페이징 리스트 출력
	public List<GroupNoticeVO> getListPaging(Criteria cri) {
		
	
		return groupNoticeMapper.getListPaging(cri);
	}
	
	//groupNotice  총 갯수
	public int getTotal(HashMap<String, Object> map) {

		return groupNoticeMapper.getTotal(map);
	}

	//그룹내 공지 상세
	@Override
	public GroupNoticeVO groupNoticeView(int group_notice_seq) {
		
		return groupNoticeMapper.groupNoticeView(group_notice_seq);
	}

	//조회수 증가
	@Override
	public void groupNoticeViewCount(int group_notice_seq) {
	
		groupNoticeMapper.groupNoticeViewCount(group_notice_seq);
	}

	//공지 수정
	@Override
	public void updateGroupNotice(GroupNoticeVO vo) {
		
		groupNoticeMapper.updateGroupNotice(vo);
	}

	//공지 삭제
	@Override
	public void deleteGroupNotice(int group_notice_seq) {
		
		groupNoticeMapper.deleteGroupNotice(group_notice_seq);
	}


	@Override
	public List<CrewInfoVIewVO> getCrewList(int group_seq, String user_id) {
		
		return groupNoticeMapper.getCrewList(group_seq, user_id);
	}
	
	
	

	
}
