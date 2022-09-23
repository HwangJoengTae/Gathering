package com.gathering.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.UserInfoVO;
import com.gathering.dto.UserInterestVO;


@Mapper
public interface UserMapper {
	
	public UserInfoVO getUser(UserInfoVO user);
	
	public void insertUser(UserInfoVO user);

	public void insertUserInterest(UserInterestVO interest);

	public UserInfoVO findId(UserInfoVO user);

	public void createTempPassword(UserInfoVO user);
}
