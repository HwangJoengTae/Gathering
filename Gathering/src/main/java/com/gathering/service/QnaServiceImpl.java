package com.gathering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gathering.dto.QnaVO;
import com.gathering.mapper.QnaMapper;
import com.gathering.paging.Criteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper qnaMapper;
	
	//QnaList 출력
	@Override
	public List<QnaVO> getQnaList() {
		
		return qnaMapper.getQnaList();
	}
	
	//QnaList(페이징+검색)
	@Override
	public List<QnaVO> getListPaging(Criteria cri) {
		
		return qnaMapper.getListPaging(cri);
	}

	//Qna총 갯수
	@Override
	public int getTotal(Criteria cri) {
		
		return qnaMapper.getTotal(cri);
	}

	
	//Qna상세
	@Override
	public QnaVO getQnaView(int qna_seq) {
		
		return qnaMapper.getQnaView(qna_seq);
	}
	
	//Qna쓰기
	@Override
	public void insertQna(QnaVO vo) {
		
		qnaMapper.insertQna(vo);
	}

	//Qna조회수 증가
	@Override
	public void qnaViewCount(int qna_seq) {
		
		qnaMapper.qnaViewCount(qna_seq);
	}

	//Qna수정
	@Override
	public void updateQna(QnaVO vo) {
		
		qnaMapper.updateQna(vo);
	}

	//Qna삭제
	@Override
	public void deleteQna(int qna_seq) {
		
		qnaMapper.deleteQna(qna_seq);
	}


	
	

}
















