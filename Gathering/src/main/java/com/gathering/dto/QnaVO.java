package com.gathering.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private int qna_seq;
	private String user_id;
	private String title;
	private String content;
	private String password;
	private String security;
	private int cnt;
	private Date regDate;
	
	
	
}
