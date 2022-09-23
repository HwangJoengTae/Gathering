package com.gathering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.QnaVO;
import com.gathering.paging.Criteria;

@Mapper
public interface QnaMapper {

	//Qna 리스트 (페이징제외) 
	public List<QnaVO> getQnaList();
	
	//Qna 리스트 (페이징)
	public List<QnaVO> getListPaging(Criteria cri);
	
	//Qna게시글 총 갯수
	public int getTotal(Criteria cri);
	
	//Qna 상세보기 
	public QnaVO getQnaView(int qna_seq);
	
	//Qna 글쓰기 
	public void insertQna(QnaVO vo);
	
	//Qna 조회수 증가
	public void qnaViewCount(int qna_seq);
	
	//Qna 수정
	public void updateQna(QnaVO vo);
	
	//Qna 삭제
	public void deleteQna(int qna_seq);
}
