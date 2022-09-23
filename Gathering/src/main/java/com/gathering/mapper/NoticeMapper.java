package com.gathering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.FilesVO;
import com.gathering.dto.NoticeVO;
import com.gathering.util.Criteria;

@Mapper
public interface NoticeMapper {

	// 게시판 목록
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO);

	// 게시판 목록(페이징 적용)
	public List<NoticeVO> getListPaging(Criteria cri);

	// 공지글 총 갯수
	public int getTotal(Criteria cri);

	// 게시판 등록
	public int InsertNotice(NoticeVO noticeVO);

	// 게시판 상세보기 (시퀀스 번호로 정보를 얻어옴)
	public NoticeVO getNotice(int notice_seq);

	// 공지사항 수정하기
	public int updateNotice(NoticeVO searchVO);

	// 공지사항 삭제하기
	public void deleteNotice(int notice_seq);

	// 이미지 등록 하기
	public void imageEnroll(FilesVO filesVO);
	
	//이미지 삭제
	public void deleteImageAll(int noitce_seq);

	// 조회수 증가
	public void noticeViewCount(int notice_seq);
	
	//이미지 정보 얻기 
	public List<FilesVO>getAttachInfo(int notice_seq);


}
