package com.gathering.service;

import java.util.HashMap;
import java.util.List;

import com.gathering.dto.AlbumVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.paging.Criteria;

public interface AlbumService {

	// 게시판 등록
	public void InsertAlbum(AlbumVO albumVO);

	// 앨범 목록
	public List<AlbumVO> getListAlbum(AlbumVO albumVO);
		
	//앨범 상세보기(댓글창 이동) 
	public AlbumVO albumDetail(int group_album_seq);
	
	// 현재 페이지 (group_album_seq,group_Seq)
	public AlbumVO getAlbumSeq(int group_seq);
	
	//앨범 삭제 
	public int deleteAlbum(int group_album_seq);
	
	//앨범 리스트 (페이징)
	public List<AlbumVO> getAlbumListPaging(Criteria cri);
			
	//앨범게 시글 총 갯수
	public int getAlbumTotal(HashMap<String, Object> map);
	
	//앨범 수정
	public int updateAlbum(AlbumVO albumVO);
	
	
}
