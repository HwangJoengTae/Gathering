package com.gathering.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.mapper.MypageMapper;
import com.gathering.paging.Criteria;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mypageMapper;
	
	@Override
	public void updateUser(UserInfoVO user) {
		mypageMapper.updateUser(user);
	}

	@Override
	public void deleteUser(UserInfoVO user) {
		mypageMapper.deleteUser(user);
	}

	@Override
	public List<Integer> getGroupSeqForOwnedGroup(String user_id) {
		return mypageMapper.getGroupSeqForOwnedGroup(user_id);
	}
	@Override
	public List<Integer> getGroupSeqForJoinedGroup(String user_id) {
		return mypageMapper.getGroupSeqForJoinedGroup(user_id);
	}
	@Override
	public List<Integer> getGroupSeqForInterestGroup(String user_id) {
		return mypageMapper.getGroupSeqForInterestGroup(user_id);
	}

	@Override
	public GroupInfoVO getGroupListForMypage(Criteria cri) {
		return mypageMapper.getGroupListForMypage(cri);
	}

	@Override
	public int getTotalGroupListForMypage(Criteria cri) {
		return mypageMapper.getTotalGroupListForMypage(cri);
	}

	

	




}
