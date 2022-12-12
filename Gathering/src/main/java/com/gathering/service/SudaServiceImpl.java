package com.gathering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.LikeVO;
import com.gathering.dto.SudaVO;
import com.gathering.mapper.SudaMapper;
import com.gathering.paging.Criteria;

@Service
public class SudaServiceImpl implements SudaService {

	@Autowired
	SudaMapper sudaMapper;

	@Override
	public List<SudaVO> getSudaList(SudaVO sudaVO) {

		return sudaMapper.getSudaList(sudaVO);
	}

	@Override
	public void insertSuda(SudaVO sudaVO) {
		
		sudaMapper.insertSuda(sudaVO);
		
	}

	@Override
	public SudaVO getSudaView(int suda_seq) {
		
		return sudaMapper.getSudaView(suda_seq);
	}

	

	@Override
	public void deleteSuda(int suda_seq) {
		
		sudaMapper.deleteSuda(suda_seq);
		
	}

	

	@Override
	public List<SudaVO> getListPaging(Criteria cri) {
		
		return sudaMapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return sudaMapper.getTotal(cri);
	}

	@Override
	public int getCrewSeq(SudaVO sudaVO) {
		
		return sudaMapper.getCrewSeq(sudaVO);
	}

	@Override
	public void updateSuda(SudaVO sudaVO) {
		sudaMapper.updateSuda(sudaVO);
		
	}

	@Override
	public int updateReplyCount(int suda_seq) {
		
		return sudaMapper.updateReplyCount(suda_seq);
	}

	@Override
	public int findLike(LikeVO likeVO) {
		
		return sudaMapper.findLike(likeVO);
	}

	@Override
	public int likeUp(LikeVO likeVO) {
		
		return sudaMapper.likeUp(likeVO);
	}

	@Override
	public int likeDown(LikeVO likeVO) {
		
		return sudaMapper.likeDown(likeVO);
	}

	@Override
	public LikeVO getLike(LikeVO likeVO) {
		
		
		return sudaMapper.getLike(likeVO);
	}

	
	
	

	

}
