package com.gathering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.CrewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.dto.InterestGroupVO;
import com.gathering.mapper.GroupMapper;
import com.gathering.paging.Criteria;

@Service
public class GroupServiceImpl implements GroupService {


	@Autowired
	private GroupMapper groupMapper;
	
	@Override
	public GroupInfoVO getGroupByGroupName(GroupInfoVO vo) {
		GroupInfoVO group = groupMapper.getGroupByGroupName(vo);
		return group;
	}

	@Override
	public void createNewGroup(GroupInfoVO vo) {
		groupMapper.createNewGroup(vo);
	}
	
	// 그룹상세부분
	@Override
	public GroupInfoVO getGroupDetail(int group_seq) {
		return groupMapper.getGroupDetail(group_seq);
	}
	@Override
	public List<GroupNoticeVO> getGroupJungmo(int gruop_seq) {
		return groupMapper.getGroupJungmo(gruop_seq);
	}
	@Override
	public List<CrewInfoVIewVO> getGroupCrews(int group_seq){
		return groupMapper.getGroupCrews(group_seq);
	}
	
	
	@Override
	public void insertCrewLeader(CrewVO vo) {
		groupMapper.insertCrewLeader(vo);
	}

	@Override
	public List<GroupInfoVO> getGroupListPaging(Criteria cri) {
		return groupMapper.getGroupListPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return groupMapper.getTotalCount(cri);
	}
	
	// 모임가입
	@Override
	public void insertCrewMember(CrewVO vo) {
		groupMapper.insertCrewMember(vo);
	}

	@Override
	public CrewVO getCrew(CrewVO vo) {
		return groupMapper.getCrew(vo);
	}

	@Override
	public void outGroupFromTable(CrewVO vo) {
		groupMapper.outGroupFromTable(vo);
	}

	@Override
	public void outGroupFromView(CrewVO vo) {
		groupMapper.outGroupFromView(vo);
	}

	@Override
	public void updateGroupInfo(GroupInfoVO vo) {
		groupMapper.updateGroupInfo(vo);
	}

	@Override
	public void deleteGroupInfo(int group_seq) {
		groupMapper.deleteGroupInfo(group_seq);
	}

	@Override
	public void addInterestGroup(InterestGroupVO vo) {
		groupMapper.addInterestGroup(vo);
	}

	@Override
	public InterestGroupVO getInterestGroup(InterestGroupVO vo) {
		return groupMapper.getInterestGroup(vo);
	}

	@Override
	public void deleteInterestGroup(InterestGroupVO vo) {
		groupMapper.deleteInterestGroup(vo);
	}

	@Override
	public List<GroupInfoVO> bestList(GroupInfoVO vo) {
		
		return groupMapper.bestList(vo);
	}




}

