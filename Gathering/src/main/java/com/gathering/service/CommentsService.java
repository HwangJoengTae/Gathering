package com.gathering.service;

import java.util.List;

import com.gathering.dto.CommentsVO;
import com.gathering.dto.QnaVO;
import com.gathering.paging.Criteria;

public interface CommentsService {

	public int insertComment(CommentsVO vo);

	//Qna댓글 총 갯수
	public int getTotal(Criteria cri);

	//Qna댓글 리스트
	public List<CommentsVO> commentList(int qna_seq);

	// Qna 페이징 리스트
	public List<CommentsVO> commentListWithPaging(Criteria cri);
	
	
	public void deleteComment(int qna_seq);
	
	
	
	//------------ 그룹 공지 댓글 파트 ----------------//
	
	public int groupInsertComment(CommentsVO vo);

	//댓글 총 갯수
	public int groupGetTotal(Criteria cri);

	//댓글 리스트
	public List<CommentsVO> groupCommentList(int qna_seq);

	// 페이징 리스트
	public List<CommentsVO> groupCommentListWithPaging(Criteria cri);
	
	
	
	//------------앨범 댓글-------------------------//
	
	//앨범 댓글 작성
	 int AlbumInsertComment(CommentsVO commentsVO);

	//앨범 댓글 리스트
	List<CommentsVO> AlbumcommentList(int group_album_seq);
	
	//앨범 삭제 
	public void AlbumdeleteComment(int group_album_seq);
	
	
	
	//-----------수다 댓글 구간---------------------//
	
	//수다 댓글 작성
	int SudaInsertComment(CommentsVO commentsVO);

	//앨범 댓글 리스트
	List<CommentsVO> SudacommentList(int group_seq);
	
	//앨범 삭제 
	public void SudadeleteComment(int suda_seq);
		

}