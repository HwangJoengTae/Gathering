package com.gathering.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gathering.dto.AlbumVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.mapper.AlbumMapper;
import com.gathering.paging.Criteria;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	AlbumMapper albumMapper;

	@Override
	public List<AlbumVO> getListAlbum(AlbumVO albumVO) {

		return albumMapper.getListAlbum(albumVO);
	}

	@Override
	public void InsertAlbum(AlbumVO albumVO) {

		albumMapper.InsertAlbum(albumVO);
	

	}

	

	@Override
	public AlbumVO albumDetail(int group_album_seq) {
		
		return albumMapper.albumDetail(group_album_seq);
	}

	@Override
	public AlbumVO getAlbumSeq(int group_seq) {
		
		return albumMapper.getAlbumSeq(group_seq);
	}

	@Override
	public int deleteAlbum(int group_album_seq) {
		return albumMapper.deleteAlbum(group_album_seq);
		
		
	}

	@Override
	public List<AlbumVO> getAlbumListPaging(Criteria cri) {
		
		return albumMapper.getAlbumListPaging(cri);
	}

	@Override
	public int getAlbumTotal(HashMap<String, Object> map) {
		
		return albumMapper.getAlbumTotal(map);
	}

	@Override
	public int updateAlbum(AlbumVO albumVO) {
		
		return albumMapper.updateAlbum(albumVO);
	}

	

	

	
	

	

	
	

	

	
	

	

	

}
