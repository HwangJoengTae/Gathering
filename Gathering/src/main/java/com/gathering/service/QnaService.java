package com.gathering.service;

import java.util.List;

import com.gathering.dto.QnaVO;
import com.gathering.paging.Criteria;

public interface QnaService {

	//QnaList 출력
	public List<QnaVO> getQnaList();
	
	//Qna 리스트 (페이징+검색)
	public List<QnaVO> getListPaging(Criteria cri);
	
	//Qna리스트 총갯수
	public int getTotal(Criteria cri);

	//Qna상세
	public QnaVO getQnaView(int qna_seq);

	//Qna쓰기
	public void insertQna(QnaVO vo);
	
	//Qna 조회수 증가
	public void qnaViewCount(int qna_seq);
	
	//Qna 수정
	public void updateQna(QnaVO vo);
	
	//Qna 삭제
	public void deleteQna(int qna_seq);
	
	

}