package com.gathering.dto;


import java.util.Date;


import lombok.Data;

@Data
public class CommentsVO {


	private int comment_seq;
	private String user_id;
	private int group_notice_seq;

	private int group_seq;
	private int group_album_seq;
	private int qna_seq;
	private String content;
	private int suda_seq;
	private Date regDate;

}
