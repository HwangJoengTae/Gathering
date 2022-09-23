package com.gathering.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {

	private int notice_seq;
	private String user_id;
	private String title;
	private String content;
	private int cnt;
	private Date regdate;
	
	/* 이미지 정보 */
	private List<FilesVO> imageList;
	

	public List<FilesVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<FilesVO> imageList) {
		this.imageList = imageList;
	}

	// 검색
	private String searchKeyword;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	

}
