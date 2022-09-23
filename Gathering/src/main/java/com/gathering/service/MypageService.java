package com.gathering.service;


import java.util.List;

import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;

public interface MypageService {

	public void updateUser(UserInfoVO user);
	
	public void deleteUser(UserInfoVO user);
	
	// 내가 만든모임의 고유넘버
	public List<Integer> getGroupSeqForOwnedGroup(String user_id);
	// 내가 가입한모임의 고유넘버
	public List<Integer> getGroupSeqForJoinedGroup(String user_id);
	// 내가 찜한 모임의 고유넘버
	public List<Integer> getGroupSeqForInterestGroup(String user_id);
	
	public GroupInfoVO getGroupListForMypage(Criteria cri);
	
	// 총갯수(페이징위한)
	public int getTotalGroupListForMypage(Criteria cri);
	
}
