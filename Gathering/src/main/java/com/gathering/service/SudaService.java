package com.gathering.service;

import java.util.List;

import com.gathering.dto.SudaVO;
import com.gathering.paging.Criteria;

public interface SudaService {

	// 수다List 출력
	List<SudaVO> getSudaList(SudaVO sudaVO);

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
	
	
	
	
}