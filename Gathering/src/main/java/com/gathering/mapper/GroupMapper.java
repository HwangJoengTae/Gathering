package com.gathering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.CrewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.dto.InterestGroupVO;
import com.gathering.paging.Criteria;

@Mapper
public interface GroupMapper {

	// 모임명 중복체크할때
	public GroupInfoVO getGroupByGroupName(GroupInfoVO vo);
	
	// 새로운 모임생성
	public void createNewGroup(GroupInfoVO vo);
	public void insertCrewLeader(CrewVO vo);
	
	// 모임상세가져오기
	public GroupInfoVO getGroupDetail(int group_seq);
	public List<GroupNoticeVO> getGroupJungmo(int gruop_seq);
	public List<CrewInfoVIewVO> getGroupCrews(int group_seq);
	
	
	//모임 리스트 (페이징)
	public List<GroupInfoVO> getGroupListPaging(Criteria cri);
		
	//모임리스트 총 갯수
	public int getTotalCount(Criteria cri);
	
	// 모임가입
	public void insertCrewMember(CrewVO vo);
	
	// 기가입크루 체크
	public CrewVO getCrew(CrewVO vo);
	
	// 모임탈퇴
	public void outGroupFromTable(CrewVO vo);
	public void outGroupFromView(CrewVO vo);
	
	// 모임정보수정
	public void updateGroupInfo(GroupInfoVO vo);
	
	// 모임삭제
	public void deleteGroupInfo(int group_seq);
	
	// 찜하기
	public void addInterestGroup(InterestGroupVO vo);
	
	// 찜정보 가져오기
	public InterestGroupVO getInterestGroup(InterestGroupVO vo);
	
	// 찜삭제
	public void deleteInterestGroup(InterestGroupVO vo);
	
}

