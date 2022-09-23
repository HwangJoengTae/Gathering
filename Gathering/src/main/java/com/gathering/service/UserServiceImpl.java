package com.gathering.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.UserInfoVO;
import com.gathering.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserInfoVO getUser(UserInfoVO user) {
		
		return userMapper.getUser(user);
	}

	@Override
	public void insertUser(UserInfoVO user) {
		userMapper.insertUser(user);
	}


	@Override
	public UserInfoVO findId(UserInfoVO user) {
		
		return userMapper.findId(user);
	}

	@Override
	public void createTempPassword(UserInfoVO user) {
		userMapper.createTempPassword(user);
	}

}
