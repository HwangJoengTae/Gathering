package com.gathering.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GroupNoticeVO {

	
	private int group_notice_seq;
	private int group_seq;
	private String type;
	private String title;
	private String content;
	private String filename;
	private Date regDate;
	private String jungmo_date;
	private String jungmo_place;
	private int cnt;
	
}

