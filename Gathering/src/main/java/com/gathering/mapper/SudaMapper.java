package com.gathering.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.LikeVO;
import com.gathering.dto.SudaVO;
import com.gathering.paging.Criteria;

@Mapper
public interface SudaMapper {

	// 수다 리스트
	public List<SudaVO> getSudaList(SudaVO sudaVO);

	//수다 리스트 페이지 적용
	public List<SudaVO> getListPaging(Criteria cri);
	
	//수다 게시글 갯수
	public int getTotal(Criteria cri);
	
	// 수다 글쓰기
	public void insertSuda(SudaVO sudaVO);

	// 수다 상세보기
	public SudaVO getSudaView(int suda_seq);
	
	// 수다 삭제하기 
	public void deleteSuda(int suda_seq);
	
	//크루 번호 얻기
	public int getCrewSeq(SudaVO sudaVO);
			
	//수다 수정하기 
	public void updateSuda(SudaVO sudaVO);
	
	//댓글 갯수
	public int updateReplyCount(int suda_seq);
	
	//좋아요 확인
	public int findLike(LikeVO likeVO);
	
	//좋아요 갯수
	public LikeVO getLike(LikeVO likeVO);
	
	//좋아요 증가
	public int likeUp(LikeVO likeVO);
		
	//좋아요 감소
	public int likeDown(LikeVO likeVO);
}
