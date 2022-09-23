package com.gathering.service;

import java.util.List;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.CrewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.dto.InterestGroupVO;
import com.gathering.paging.Criteria;

public interface GroupService {


	public GroupInfoVO getGroupByGroupName(GroupInfoVO vo);
	
	public void createNewGroup(GroupInfoVO vo);
	public void insertCrewLeader(CrewVO vo);
	
	public GroupInfoVO getGroupDetail(int group_seq);
	public List<GroupNoticeVO> getGroupJungmo(int gruop_seq);
	public List<CrewInfoVIewVO> getGroupCrews(int group_seq);
	
	public List<GroupInfoVO> getGroupListPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	// 모임가입
	public void insertCrewMember(CrewVO vo);
	
	public CrewVO getCrew(CrewVO vo);

	public void outGroupFromTable(CrewVO vo);
	public void outGroupFromView(CrewVO vo);
	
	public void updateGroupInfo(GroupInfoVO vo);

	public void deleteGroupInfo(int group_seq);

	// 찜하기
	public void addInterestGroup(InterestGroupVO vo);

	// 찜정보 가져오기
	public InterestGroupVO getInterestGroup(InterestGroupVO vo);
	
	// 찜삭제
	public void deleteInterestGroup(InterestGroupVO vo);

}

