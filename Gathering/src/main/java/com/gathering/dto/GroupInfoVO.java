package com.gathering.dto;

import lombok.Data;

@Data
public class GroupInfoVO {
	
	private int group_seq;
	private String group_name;
	private String brief;
	private String detail;
	private String kind;
	private String region;
	private String member_limit;
	
	
}
