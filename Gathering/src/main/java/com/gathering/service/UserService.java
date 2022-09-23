package com.gathering.service;


import com.gathering.dto.UserInfoVO;


public interface UserService {

	public UserInfoVO getUser(UserInfoVO user);
	
	public void insertUser(UserInfoVO user);

	public UserInfoVO findId(UserInfoVO user);
	
	public void createTempPassword(UserInfoVO user);
}
