package com.gathering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.FilesVO;

@Mapper
public interface AttachMapper {
	/* 이미지 데이터 반환 */
	public List<FilesVO> getAttachList(int notice_seq);
}
