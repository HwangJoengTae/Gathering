package com.gathering.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;

@Mapper
public interface MypageMapper {

	// 회원정보수정 
	public void updateUser(UserInfoVO user);
	
	// 회원탈퇴
	public void deleteUser(UserInfoVO user);
	
	// 내가 만든모임의 고유넘버
	public List<Integer> getGroupSeqForOwnedGroup(String user_id);
	
	// 내가 가입한모임의 고유넘버
	public List<Integer> getGroupSeqForJoinedGroup(String user_id);
	
	// 내가 찜한 모임의 고유넘버
	public List<Integer> getGroupSeqForInterestGroup(String user_id);
	
	// 마이페이지용 모임리스트
	public GroupInfoVO getGroupListForMypage(Criteria cri);
	
	// 총갯수(페이징위한)
	public int getTotalGroupListForMypage(Criteria cri);
	
}
